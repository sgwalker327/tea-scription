class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions
  has_many :customer_subscriptions, through: :subscriptions
end
