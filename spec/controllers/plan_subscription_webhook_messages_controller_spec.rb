require 'spec_helper'

RSpec.describe "plan subscription webhooks", :type => :request do
  describe "POST webhook" do
    it "empty API key" do
      post "http://webhooks.sharetribe.com/webhooks/plan_subscriptions"
      expect(response.status).to eq(401)
    end

    it "invalid API key" do
      post "http://webhooks.sharetribe.com/webhooks/plan_subscriptions", api_key: "aaaa"
      expect(response.status).to eq(401)
    end

    it "valid API key" do
      post "http://webhooks.sharetribe.com/webhooks/plan_subscriptions", api_key: "12345abcde"
      expect(response.status).to eq(200)
    end
  end
end
