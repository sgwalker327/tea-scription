class DropCustomerSubscriptions < ActiveRecord::Migration[7.0]
  def change
    drop_table :customer_subscriptions
  end
end
