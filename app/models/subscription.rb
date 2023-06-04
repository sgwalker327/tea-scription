class Subscription < ApplicationRecord
  belongs_to :tea
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions

  enum frequency: [:monthly, :biweekly, :weekly]
end
