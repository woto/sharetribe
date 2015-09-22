class AddPlanSubscriptionWebhookMessages < ActiveRecord::Migration
  def up
    create_table :plan_subscription_webhook_messages do |t|
      t.text "body"
      t.timestamps
    end
  end

  def down
    drop_table :plan_subscription_webhook_messages
  end
end
