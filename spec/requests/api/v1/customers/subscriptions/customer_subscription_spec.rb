require 'rails_helper'

RSpec.describe 'Customer Subscriptions Requests' do
  describe 'When successful' do
    context 'POST /api/v1/customers/:id/subscriptions' do
      it 'creates a new subscription' do
        customer = Customer.create!(first_name: 'Bob', last_name: 'Gu', email: 'Bob@bob.com', address: '1234 Rails St')
        tea = Tea.create!(title: 'Earl Grey', description: 'Tea', temperature: 200, brew_time: 5)
        attributes = { title: "Green Tea Everyday", price: 14.50, frequency: 'weekly', tea_id: tea.id, customer_id: customer.id }
        
        post api_v1_customer_subscriptions_path(customer.id), params: attributes
        
        expect(response).to be_successful

        subscription = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(subscription[:attributes][:title]).to eq(attributes[:title])
        expect(subscription[:attributes][:customer_id]).to eq(attributes[:customer_id])
        expect(subscription[:attributes][:status]).to eq('active')

      end
    end

    context 'PUT /api/v1/customers/:id/subscriptions/:id' do
      it 'deletes a subscription' do
        customer = Customer.create!(first_name: 'Bob', last_name: 'Gu', email: 'Bob@bob.com', address: '1234 Rails St')
        tea = Tea.create!(title: 'Earl Grey', description: 'Tea', temperature: 200, brew_time: 5)
        sub1= Subscription.create!(title: "Green Tea Everyday", price: 14.50, frequency: 2, tea_id: tea.id, customer_id: customer.id, status: 1)
        sub2 = Subscription.create!(title: "Green Tea Every Now and Then", price: 7.50, frequency: 0, tea_id: tea.id, customer_id: customer.id, status: 0)
        expect(sub2.status).to eq('active')
        put api_v1_customer_subscription_path(customer, sub2)
        
        expect(response).to be_successful
        
        subscription = JSON.parse(response.body, symbolize_names: true)
        
        expect(subscription[:data][:attributes][:status]).to eq('cancelled')
      end
    end
      
    context 'GET /api/v1/customers/:id/subscriptions' do
      it 'returns a list of all of a customers subscriptions, active and cancelled' do
        customer = Customer.create!(first_name: 'Bob', last_name: 'Gu', email: 'Bob@bob.com', address: '1234 Rails St')
        tea = Tea.create!(title: 'Earl Grey', description: 'Tea', temperature: 200, brew_time: 5)
        sub1= Subscription.create!(title: "Green Tea Everyday", price: 14.50, frequency: 2, tea_id: tea.id, customer_id: customer.id, status: 1)
        sub2 = Subscription.create!(title: "Green Tea Every Now and Then", price: 7.50, frequency: 0, tea_id: tea.id, customer_id: customer.id, status: 0)

        get api_v1_customer_subscriptions_path(customer.id)

        expect(response).to be_successful

        subscriptions = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(subscriptions.count).to eq(2)
        expect(subscriptions[0][:attributes][:title]).to eq(sub1.title)
        expect(subscriptions[1][:attributes][:title]).to eq(sub2.title)
      end
    end
  end
end