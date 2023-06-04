require 'rails_helper'

RSpec.describe 'Customer Subscriptions Index Request' do
  describe 'When successful' do
    it 'returns a list of all of a customers subscriptions' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = create(:subscription, tea_id: tea.id)
      customer_subscription = create(:customer_subscription, customer_id: customer.id, subscription_id: subscription.id)
      customer_subscription_2 = create(:customer_subscription, customer_id: customer.id, subscription_id: subscription.id)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful

      subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(subscriptions.count).to eq(2)
      expect(subscriptions.first[:id]).to eq(customer_subscription.id.to_s)
      expect(subscriptions.last[:id]).to eq(customer_subscription_2.id.to_s)

    end
  end
end