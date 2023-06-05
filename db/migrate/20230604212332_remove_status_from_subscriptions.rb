class RemoveStatusFromSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_table :subscriptions do |t|
      t.remove :status
    end
  end
end
