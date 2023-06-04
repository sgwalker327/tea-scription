# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
c1 = Customer.create!(first_name: "Steve", last_name: "Steverson", email: "steve@steve.com", address: "123 Main St, Minturn, CO 81645")
c2 = Customer.create!(first_name: "Ruth", last_name: "Rutherson", email: "ruth@ruth.com", address: "123 Main St, Avon, CO 81620")

green = Tea.create!(title: "Green Tea", description: "Green tea is a tea characterized by it's green color.", temperature: 180, brew_time: 180)
earl = Tea.create!(title: "Earl Grey", description: "Earl Grey is tea made famous by the Earl of Grey.", temperature: 160, brew_time: 210)
black = Tea.create!(title: "Black Tea", description: "Black tea is black.", temperature: 170, brew_time: 190)

sub1 = Subscription.create!(title: "Green Tea Everyday", price: 10.00, status: 0, frequency: 0, tea_id: green.id)
