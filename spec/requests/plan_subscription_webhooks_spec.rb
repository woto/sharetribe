require 'spec_helper'

RSpec.describe "plan subscription webhooks", :type => :request do

  describe "API key" do
    let(:content) { {message: "ok"}.to_json }

    it "empty API key" do
      post "http://webhooks.sharetribe.com/webhooks/plan_subscriptions", content, format: :json
      expect(response.status).to eq(401)
    end

    it "invalid API key" do
      post "http://webhooks.sharetribe.com/webhooks/plan_subscriptions?api_key=aaaa", content, format: :json
      expect(response.status).to eq(401)
    end

    it "valid API key" do
      post "http://webhooks.sharetribe.com/webhooks/plan_subscriptions?api_key=12345abcde", content, format: :json
      expect(response.status).to eq(200)
    end
  end

  describe "POST webhook" do
    it "stores webhook messages" do
      # TODO Use API layer to assert the expected result
      expect(PlanSubscriptionWebhookMessage.count).to eq(0)

      content = {message: "ok"}.to_json
      post "http://webhooks.sharetribe.com/webhooks/plan_subscriptions?api_key=12345abcde", content, format: :post

      # TODO Use API layer to assert the expected result
      expect(PlanSubscriptionWebhookMessage.first.body).to eq(content)
    end
  end
end
