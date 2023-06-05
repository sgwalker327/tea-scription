class AddStatusToCustomerSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_table :customer_subscriptions do |t|
      t.integer :status, default: 0
    end
  end
end
