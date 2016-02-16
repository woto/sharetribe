Kassi::Application.routes.draw do

  namespace :mercury do
    resources :images
  end

  mount Mercury::Engine => '/'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  get "/robots.txt" => RobotsGenerator

  # A route for DV test file
  # A CA will check if there is a file in this route
  get "/:dv_file" => "domain_validation#index", constraints: {dv_file: /.*\.txt/}

  get "/design" => "design#design"

  # config/routes.rb
  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end

  # Some non-RESTful mappings
  get '/webhooks/braintree' => 'braintree_webhooks#challenge'
  post '/webhooks/braintree' => 'braintree_webhooks#hooks'
  post '/webhooks/paypal_ipn' => 'paypal_ipn#ipn_hook', as: :paypal_ipn_hook
  post '/webhooks/plans' => 'plans#create'
  get '/webhooks/trials' => 'plans#get_trials'

  post '/bounces' => 'amazon_bounces#notification'

  get "/people/:person_id/inbox/:id", :to => redirect("/fi/people/%{person_id}/messages/%{id}")
  get "/listings/new/:type" => "listings#new", :as => :new_request_without_locale # needed for some emails, where locale part is already set
  get "/change_locale" => "i18n#change_locale", :as => :change_locale


  # Prettier link for admin panel
  namespace :admin do
    get '' => "communities#getting_started"
  end

  # Internal API
  namespace :int_api do
    post "/create_trial_marketplace" => "marketplaces#create"
    get "/check_email_availability" => "marketplaces#check_email_availability"
  end

  REMOVED_LOCALES = Rails.application.config.REMOVED_LOCALES.to_a

  locale_matcher = Regexp.new(Sharetribe::AVAILABLE_LOCALES.map { |l| l[:ident] }.concat(REMOVED_LOCALES).join("|"))

  # Inside this constraits are the routes that are used when request has subdomain other than www
  get '/:locale/' => 'homepage#index', :constraints => { :locale => locale_matcher }, as: :homepage_with_locale
  get '/' => 'homepage#index', as: :homepage_without_locale
  root :to => 'homepage#index'

  # error handling: 3$: http://blog.plataformatec.com.br/2012/01/my-five-favorite-hidden-features-in-rails-3-2/
  get '/500' => 'errors#server_error'
  get '/404' => 'errors#not_found', :as => :error_not_found
  get '/406' => 'errors#not_acceptable', :as => :error_not_acceptable
  get '/410' => 'errors#gone', as: :error_gone
  get '/community_not_found' => 'errors#community_not_found', as: :community_not_found

  resources :communities, only: [:new, :create]


  devise_for :people, only: :omniauth_callbacks, controllers: { omniauth_callbacks: "sessions" }

  # Adds locale to every url right after the root path
  scope "(/:locale)", :constraints => { :locale => locale_matcher } do

    put '/mercury_update' => "mercury_update#update", :as => :mercury_update

    get "/transactions/op_status/:process_token" => "transactions#op_status", :as => :transaction_op_status

    # All new transactions (in the future)
    get "/transactions/new" => "transactions#new", as: :new_transaction

    # preauthorize flow
    get "/listings/:listing_id/preauthorize" => "preauthorize_transactions#preauthorize", :as => :preauthorize_payment
    post "/listings/:listing_id/preauthorized" => "preauthorize_transactions#preauthorized", :as => :preauthorized_payment
    get "/listings/:listing_id/book" => "preauthorize_transactions#book", :as => :book
    post "/listings/:listing_id/booked" => "preauthorize_transactions#booked", :as => :booked
    get "/listings/:listing_id/initiate" => "preauthorize_transactions#initiate", :as => :initiate_order
    post "/listings/:listing_id/initiated" => "preauthorize_transactions#initiated", :as => :initiated_order

    # post pay flow
    get "/listings/:listing_id/post_pay" => "post_pay_transactions#new", :as => :post_pay_listing
    post "/listings/:listing_id/create_transaction" => "post_pay_transactions#create", :as => :create_transaction

    # free flow
    post "/listings/:listing_id/create_contact" => "free_transactions#create_contact", :as => :create_contact
    get "/listings/:listing_id/contact" => "free_transactions#contact", :as => :contact_to_listing

    get "/logout" => "sessions#destroy", :as => :logout
    get "/confirmation_pending" => "sessions#confirmation_pending", :as => :confirmation_pending
    get "/login" => "sessions#new", :as => :login
    get "/listing_bubble/:id" => "listings#listing_bubble", :as => :listing_bubble
    get "/listing_bubble_multiple/:ids" => "listings#listing_bubble_multiple", :as => :listing_bubble_multiple
    get '/:person_id/settings/payments/braintree/new' => 'braintree_accounts#new', :as => :new_braintree_settings_payment
    get '/:person_id/settings/payments/braintree/show' => 'braintree_accounts#show', :as => :show_braintree_settings_payment
    post '/:person_id/settings/payments/braintree/create' => 'braintree_accounts#create', :as => :create_braintree_settings_payment
    get '/:person_id/settings/payments/paypal_account' => 'paypal_accounts#index', :as => :paypal_account_settings_payment

    namespace :paypal_service do
      resources :checkout_orders do
        collection do
          get :success
          get :cancel
          get :success_processed
        end
      end
    end

    namespace :admin do

      get  "/paypal_preferences"                      => "paypal_preferences#index"
      post "/paypal_preferences/preferences_update"   => "paypal_preferences#preferences_update"
      get  "/paypal_preferences/account_create"       => "paypal_preferences#account_create"
      get  "/paypal_preferences/permissions_verified" => "paypal_preferences#permissions_verified"

      resources :communities do
        member do
          get :getting_started, to: 'communities#getting_started'
          get :edit_details, to: 'community_customizations#edit_details'
          put :update_details, to: 'community_customizations#update_details'
          get :edit_look_and_feel
          put :edit_look_and_feel, to: 'communities#update_look_and_feel'
          get :edit_welcome_email
          post :create_sender_address
          get :check_email_status
          post :resend_verification_email
          get :edit_text_instructions
          get :test_welcome_email
          get :settings
          get :payment_gateways
          put :payment_gateways, to: 'communities#update_payment_gateway'
          post :payment_gateways, to: 'communities#create_payment_gateway'
          get :social_media
          get :analytics
          put :social_media, to: 'communities#update_social_media'
          put :analytics, to: 'communities#update_analytics'
          get :menu_links
          put :menu_links, to: 'communities#update_menu_links'
          put :update_settings
          delete :delete_marketplace
        end
        resources :transactions, controller: :community_transactions, only: :index
        resources :emails
        resources :community_memberships do
          member do
            put :ban
          end
          collection do
            post :promote_admin
            post :posting_allowed
          end
        end
        resource :paypal_preferences, only: :index do

          # DEPRECATED (2015-11-16)
          # Do not add new routes here.
          # See the above :paypal_preferences resource, outside of communities resource

          member do
            get :index,                to: redirect("/admin/paypal_preferences")
            post :preferences_update   # POST request, no redirect
            get :account_create,       to: redirect("/admin/paypal_preferences/account_create")
            get :permissions_verified, to: redirect("/admin/paypal_preferences/permissions_verified")
          end
        end
      end
      resources :custom_fields do
        collection do
          get :add_option
          get :edit_price
          get :edit_location
          post :order
          put :update_price
          put :update_location
        end
      end
      resources :categories do
        member do
          get :remove
          delete :destroy_and_move
        end
        collection do
          post :order
        end
      end
      resources :profile_settings
      resources :profile_custom_fields
      resources :listing_shapes do
        collection do
          post :order
        end
        member do
          get :close_listings
        end
      end
      resource :plan, only: [:show]
    end

    resources :invitations
    resources :user_feedbacks, :controller => :feedbacks
    resources :homepage do
      collection do
        get :sign_in
        get :not_member
        post :join
      end
    end
    resources :community_memberships, :as => :tribe_memberships do
      collection do
        get :access_denied
      end
    end
    namespace :education do
      resources :requests do
      end
      resources :offers do
      end
    end
    resources :listings do
      member do
        post :follow
        delete :unfollow
      end
      collection do
        get :new_form_content
        get :edit_form_content
        get :more_listings
        get :browse
        get :locations_json
        get :verification_required
      end
      resources :comments, :only => [:create, :destroy]
      resources :listing_images do
        collection do
          post :add_from_file
          put :add_from_url
        end
      end
    end

    resources :listing_images do
      member do
        get :image_status
      end
      collection do
        post :add_from_file
        put :add_from_url
      end
    end

    resources :infos do
      collection do
        get :about
        get :how_to_use
        get :terms
        get :privacy
        get :news
      end
    end
    resource :terms do
      member do
        post :accept
      end
    end
    resources :sessions do
      collection do
        post :request_new_password
        post :change_mistyped_email
      end
    end
    resources :consent
    resource :sms do
      get :message_arrived
    end

    devise_for :people, skip: :omniauth_callbacks, controllers: { confirmations: "confirmations", registrations: "people", omniauth_callbacks: "sessions"}, :path_names => { :sign_in => 'login'}
    devise_scope :person do
      # these matches need to be before the general resources to have more priority
      get "/people/confirmation" => "confirmations#show", :as => :confirmation
      put "/people/confirmation" => "confirmations#create"
      get "/people/sign_up" => redirect("/%{locale}/login")

      # List few specific routes here for Devise to understand those
      get "/signup" => "people#new", :as => :sign_up
      get '/people/auth/:provider/setup' => 'sessions#facebook_setup' #needed for devise setup phase hook to work

      resources :people, :path => "", :only => :show, :constraints => { :id => /[_a-z0-9]+/ }

      resources :people, :constraints => { :id => /[_a-z0-9]+/ } do
        collection do
          get :check_username_availability
          get :check_email_availability
          get :check_email_availability_and_validity
          get :check_invitation_code
          get :not_member
          get :cancel
          get :create_facebook_based
        end
      end

      resources :people, :path => "" do
        member do
          put :activate
          put :deactivate
        end
        resources :listings do
          member do
            put :close
            put :move_to_top
            put :show_in_updates_email
          end
        end
        resources :person_messages

        resource :inbox, :only => [:show]

        resources :messages, :controller => :conversations do
          collection do
            # This is only a redirect from old route, changed 2014-09-11
            # You can clean up this later
            get :received, to: 'inboxes#show'
          end
          member do
            get :accept, to: 'accept_conversations#accept'
            get :reject, to: 'accept_conversations#reject'
            put :acceptance, to: 'accept_conversations#acceptance'
            get :confirm, to: 'confirm_conversations#confirm'
            get :cancel, to: 'confirm_conversations#cancel'
            put :confirmation, to: 'confirm_conversations#confirmation' #TODO these should be under transaction
            get :accept_preauthorized, to: 'accept_preauthorized_conversations#accept'
            get :reject_preauthorized, to: 'accept_preauthorized_conversations#reject'
            put :acceptance_preauthorized, to: 'accept_preauthorized_conversations#accepted_or_rejected'
          end
          resources :messages
          resources :feedbacks, :controller => :testimonials do
            collection do
              put :skip
            end
          end
          resources :payments do
            member do
              get :done
            end
          end
          resources :braintree_payments
        end
        resource :paypal_account, only: [:index] do
          member do
            get :ask_order_permission
            get :ask_billing_agreement
            get :permissions_verified
            get :billing_agreement_success
            get :billing_agreement_cancel
          end
        end
        resources :transactions, only: [:show, :new, :create]
        resource :checkout_account, only: [:new, :show, :create]
        resource :settings do
          member do
            get :account
            get :notifications
            get :payments
            get :unsubscribe
          end
        end
        resources :testimonials
        resources :emails do
          member do
            post :send_confirmation
          end
        end
        resources :followers
        resources :followed_people
      end # people

    end # devise scope person

    get "/:person_id/messages/:conversation_type/:id" => "conversations#show", :as => :single_conversation

    get '/:person_id/settings/profile', to: redirect("/%{person_id}/settings") #needed to keep old links working

  end # scope locale

  id_to_username = Proc.new do |params, req|
    username = Person.find(params[:person_id]).try(:username)
    locale = params[:locale] + "/" if params[:locale]
    if username
      "/#{locale}#{username}#{params[:path]}"
    else
      "/404"
    end
  end

  get "(/:locale)/people/:person_id(*path)" => redirect(id_to_username), :constraints => { :locale => locale_matcher, :person_id => /[a-zA-Z0-9_-]{20,}/ }

  #keep this matcher last
  #catches all non matched routes, shows 404 and logs more reasonably than the alternative RoutingError + stacktrace

  match "*path" => "errors#not_found", via: :all
end
