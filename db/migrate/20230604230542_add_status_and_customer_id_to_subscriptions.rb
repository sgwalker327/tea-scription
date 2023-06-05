class AddStatusAndCustomerIdToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_table :subscriptions do |t|
      t.integer :status, default: 0
      t.references :customer, null: false, foreign_key: true
    end
  end
end
