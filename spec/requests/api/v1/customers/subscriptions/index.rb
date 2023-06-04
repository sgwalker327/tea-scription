require 'rails_helper'

RSpec.describe 'Customer Subscriptions Index Request' do
  describe 'When successful' do
    it 'returns a list of all of a customers subscriptions, active and cancelled' do
      customer = Customer.create!(first_name: 'Bob', last_name: 'Gu', email: 'Bob@bob.com', address: '1234 Rails St')
      tea = Tea.create!(title: 'Earl Grey', description: 'Tea', temperature: 200, brew_time: 5)
      sub1= Subscription.create!(title: "Green Tea Everyday", price: 14.50, frequency: 2, tea_id: tea.id, customer_id: customer.id, status: 1)
      sub2 = Subscription.create!(title: "Green Tea Every Now and Then", price: 7.50, frequency: 0, tea_id: tea.id, customer_id: customer.id, status: 0)    # customer_subscription = CustomerSubscription.create!(customer_id: customer.id, subscription_id: sub1.id, status: 1)

      get api_v1_customer_subscriptions_path(customer.id)

      binding.pry
      expect(response).to be_successful

      subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(subscriptions.count).to eq(2)
      # expect(subscriptions.first[:id]).to eq(customer_subscription.id.to_s)
      # expect(subscriptions.last[:id]).to eq(customer_subscription_2.id.to_s)

    end
  end
end