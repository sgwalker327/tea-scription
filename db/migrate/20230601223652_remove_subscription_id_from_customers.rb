class RemoveSubscriptionIdFromCustomers < ActiveRecord::Migration[7.0]
  def change
    change_table :customers do |t|
    t.remove :subscription_id
    end
  end
end
