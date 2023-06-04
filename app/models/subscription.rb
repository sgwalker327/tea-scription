class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer

  enum frequency: [:monthly, :biweekly, :weekly]
  enum status: [:active, :cancelled]
end
