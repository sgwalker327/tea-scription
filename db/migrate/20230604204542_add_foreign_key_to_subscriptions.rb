class AddForeignKeyToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    change_table :subscriptions do |t|
      t.references :tea, foreign_key: true
    end
  end
end
