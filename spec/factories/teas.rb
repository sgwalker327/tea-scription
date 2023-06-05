FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Music::Phish.song }
    temperature { Faker::Number.between(from: 100, to: 300) }
    brew_time { Faker::Number.between(from: 100, to: 300) }
  end
end
