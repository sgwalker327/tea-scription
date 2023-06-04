FactoryBot.define do
  factory :subscription do
    title { Faker::Tea.type }
    price { Faker::Number.float(l_digits: 2) }
    frequency { Faker::Number.between(from: 0, to: 2) }
    tea { Faker::Number.between(from: 0, to: 2)}
  end
end
