class Api::V1::Customers::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create(subscription_params)
      if subscription.valid?
        render json: SubscriptionSerializer.new(subscription)
      else
        render json: {error: "Subscription not created"}
      end
  end

  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end

  def update
    subscription = Subscription.find(params[:id])
    if subscription.status == 'cancelled'
      subscription.update(status: 0)
      render json: SubscriptionSerializer.new(subscription)
    else
      subscription.update(status: 1)
      render json: SubscriptionSerializer.new(subscription)
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :frequency, :status, :tea_id, :customer_id)
  end
end