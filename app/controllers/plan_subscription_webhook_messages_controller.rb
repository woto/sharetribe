class PlanSubscriptionWebhookMessagesController < ApplicationController

  # include PaypalService::MerchantInjector
  # include PaypalService::IPNInjector

  skip_before_filter :verify_authenticity_token, :fetch_logged_in_user, :fetch_community, :fetch_community_membership
  skip_filter :check_email_confirmation

  before_filter :ensure_api_key

  # IPNDataTypes = PaypalService::DataTypes::IPN

  def webhook
    PlanSubscriptionWebhookMessage.create(body: request.raw_post)

    # We received the message ok, so send back 200 OK with empty body
    render nothing: true
  end

  def ensure_api_key
    unless params[:api_key] == "12345abcde"
      render json: { error: "Unauthorized. API key doesn't match."}, status: 401
    end
  end
end
