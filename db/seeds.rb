# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
c1 = Customer.create!(first_name: "Steve", last_name: "Steverson", email: "steve@steve.com", address: "123 Main St, Minturn, CO 81645")
c2 = Customer.create!(first_name: "Ruth", last_name: "Rutherson", email: "ruth@ruth.com", address: "123 Main St, Avon, CO 81620")
c3 = Customer.create!(first_name: "Billiam", last_name: "Willams", email: "billiam@bill.com", address: "123 Main St, Vail, CO 81657")

green = Tea.create!(title: "Green Tea", description: "Green tea is a tea characterized by it's green color.", temperature: 180, brew_time: 180)
earl = Tea.create!(title: "Earl Grey", description: "Earl Grey is tea made famous by the Earl of Grey.", temperature: 160, brew_time: 210)
black = Tea.create!(title: "Black Tea", description: "Black tea is black.", temperature: 170, brew_time: 190)

sub1 = Subscription.create!(title: "Green Tea Everyday", price: 14.50, frequency: 2, tea_id: green.id)
sub2 = Subscription.create!(title: "Green Tea Every Now and Then", price: 7.50, frequency: 0, tea_id: green.id)
sub3 = Subscription.create!(title: "Earl Pretty Frequently", price: 11.00, frequency: 1, tea_id: earl.id)
sub4 = Subscription.create!(title: "Everyday Earl", price: 15.00, frequency: 2, tea_id: earl.id)
sub5 = Subscription.create!(title: "Black Tea Everyday", price: 15.00, frequency: 2, tea_id: black.id)
sub6 = Subscription.create!(title: "Black Tea Every Now and Then", price: 8.00, frequency: 0, tea_id: black.id)
sub7 = Subscription.create!(title: "Black Tea Pretty Frequently", price: 11.50, frequency: 1, tea_id: black.id)

CustomerSubscription.create!(customer_id: c1.id, subscription_id: sub1.id, status: 0)
CustomerSubscription.create!(customer_id: c1.id, subscription_id: sub3.id, status: 0)
CustomerSubscription.create!(customer_id: c1.id, subscription_id: sub6.id, status: 0)
CustomerSubscription.create!(customer_id: c1.id, subscription_id: sub2.id, status: 1)
CustomerSubscription.create!(customer_id: c2.id, subscription_id: sub3.id, status: 0)
CustomerSubscription.create!(customer_id: c2.id, subscription_id: sub1.id, status: 0)
CustomerSubscription.create!(customer_id: c2.id, subscription_id: sub2.id, status: 1)
CustomerSubscription.create!(customer_id: c3.id, subscription_id: sub4.id, status: 0)
CustomerSubscription.create!(customer_id: c3.id, subscription_id: sub7.id, status: 1)
