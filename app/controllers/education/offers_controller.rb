class Education::OffersController < ApplicationController


  def new

    @listings = @current_user.listings

    shape = get_shape(LISTING_SHAPE)

    @listing = Listing.new(
      category: @current_community.categories.find(CATEGORY),
      transaction_process_id: shape[:transaction_process_id],
      listing_shape_id: shape[:id]
    )


    #@known_subjects = CustomFieldOption.
    #  joins(:custom_field_values).
    #  where(custom_field_id: SUBJECT).
    #  where(custom_field_values: {listing_id: @current_user.listings.ids}).
    #  pluck(:id)

    #/= debug selected_subjects = @current_user.listings.joins(:custom_field_values).where(:custom_field_values => {:custom_field_id => 1})
    #/= CustomFieldValue.where(listing_id: @current_user.listings.ids, custom_field_id: subject).joins(:selected_options).all


    # PaymentRegistrationGuard needs this to be set before posting

    allow_posting, error_msg = [true, ""]

    if allow_posting
      render locals: form_locals(shape).merge(
               run_js_immediately: true
             )
    else
      render 'register', locals: { error_msg: error_msg }
    end
  end

  def listings_api
    ListingService::API::Api
  end

  def form_locals(shape)
    if shape
      unit_options = ListingViewUtils.unit_options(shape[:units], unit_from_listing(@listing))

      community_country_code = LocalizationUtils.valid_country_code(@current_community.country)

      commission(@current_community, :none).merge({
        shape: shape,
        unit_options: unit_options,
        shipping_price: Maybe(@listing).shipping_price.or_else(0).to_s,
        shipping_enabled: @listing.require_shipping_address?,
        pickup_enabled: @listing.pickup_enabled?,
        shipping_price_additional: 0,
        always_show_additional_shipping_price: shape[:units].length == 1 && shape[:units].first[:kind] == :quantity,
        paypal_fees_url: PaypalCountryHelper.fee_link(community_country_code)
      })
    else
      nil
    end
  end

  def unit_from_listing(listing)
    HashUtils.compact({
      type: Maybe(listing.unit_type).to_sym.or_else(nil),
      quantity_selector: Maybe(listing.quantity_selector).to_sym.or_else(nil),
      unit_tr_key: listing.unit_tr_key,
      unit_selector_tr_key: listing.unit_selector_tr_key
    })
  end

  def commission(community, process)
    payment_type = MarketplaceService::Community::Query.payment_type(community.id)
    payment_settings = TransactionService::API::Api.settings.get_active(community_id: community.id).maybe
    currency = community.default_currency

    case [payment_type, process]
    when matches([__, :none])
      {seller_commission_in_use: false,
       payment_gateway: nil,
       minimum_commission: Money.new(0, currency),
       commission_from_seller: 0,
       minimum_price_cents: 0}
    when matches([:paypal])
      p_set = Maybe(payment_settings_api.get_active(community_id: community.id))
        .select {|res| res[:success]}
        .map {|res| res[:data]}
        .or_else({})

      {seller_commission_in_use: payment_settings[:commission_type].or_else(:none) != :none,
       payment_gateway: payment_type,
       minimum_commission: Money.new(p_set[:minimum_transaction_fee_cents], currency),
       commission_from_seller: p_set[:commission_from_seller],
       minimum_price_cents: p_set[:minimum_price_cents]}
    else
      {seller_commission_in_use: !!community.commission_from_seller,
       payment_gateway: payment_type,
       minimum_commission: Money.new(0, currency),
       commission_from_seller: community.commission_from_seller,
       minimum_price_cents: community.absolute_minimum_price(currency).cents}
    end
  end

  def get_shape(listing_shape_id)
    shape_find_opts = {
      community_id: @current_community.id,
      listing_shape_id: listing_shape_id
    }

    shape_res = listings_api.shapes.get(shape_find_opts)

    if shape_res.success
      shape_res.data
    else
      raise ArgumentError.new(shape_res.error_msg) unless shape_res.success
    end
  end

  def create
    params[:education][:subjects].each do |id, hash|
      if (listing = @current_user.listings.where(id: id).first).present?
        if hash.key? :subject
          # update listing
        else
          # destroy listing
          ActiveRecord::Base.transaction do
            listing.destroy!
            custom_field_value_ids = listing.custom_field_values.map(&:id)
            CustomFieldOptionSelection.where(custom_field_value_id: custom_field_value_ids).delete_all
            CustomFieldValue.where(id: custom_field_value_ids).delete_all
          end
        end
      elsif hash.key? :subject
        # create listing
        shape = get_shape(LISTING_SHAPE)

        ActiveRecord::Base.transaction do
          listing = Listing.create!(
            author: @current_user,
            title: 'aaa',
            community_id: @current_community.id,
            category: @current_community.categories.find(CATEGORY),
            transaction_process_id: shape[:transaction_process_id],
            listing_shape_id: shape[:id]
          )
          subject_field_value = DropdownFieldValue.new.tap do |dfv| 
            dfv.listing_id = listing.id
            dfv.custom_field_id = SUBJECT
            dfv.custom_field_option_selections = [CustomFieldOptionSelection.new(custom_field_value: subject_field_value, custom_field_option_id: params['education']['subjects'][id]['subject'])]
          end.save!

          degree_field_value = DropdownFieldValue.new.tap do |dfv|
            dfv.listing_id = listing.id
            dfv.custom_field_id = DEGREE
            dfv.custom_field_option_selections = [CustomFieldOptionSelection.new(custom_field_value: degree_field_value, custom_field_option_id: params['education']['subjects'][id]['degree'])]
            dfv.save!
          end.save!

          #CustomFieldOptionSelection.create!(custom_field_value: subject_field_value, custom_field_option_id: params['education'][listing.id]['subject'])
          #CustomFieldOptionSelection.create!(custom_field_value: degree_field_value, custom_field_option_id: params['education'][listing.id]['degree'])
        end

      end
    end
  end

end
