FactoryBot.define do
  factory :item do
    association :user
    # image             { Faker::Lorem.sentence }
    name              { Faker::Name.name }
    description       { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 2, to: 10) }
    condition_id      { Faker::Number.between(from: 2, to: 7) }
    delivery_fee_id   { Faker::Number.between(from: 2, to: 3) }
    state_id          { Faker::Number.between(from: 2, to: 48) }
    day_id            { Faker::Number.between(from: 2, to: 4) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
