FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.type }
    price { Faker::Number.float(l_digits: 2) }
    frequency { Faker::Number.between(from: 0, to: 2) }
    tea { Faker::Number.between(from: 0, to: 2)}
    customer_id { Faker::Number.between(from: 0, to: 2) }
    status { Faker::Number.between(from: 0, to: 1)}
  end
end
