class Api::V1::Customers::SubscriptionsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])
    subscriptions = customer.subscriptions
    require 'pry'; binding.pry
    render json: CustomerSerializer.new(customer).serializable_hash
  end
end