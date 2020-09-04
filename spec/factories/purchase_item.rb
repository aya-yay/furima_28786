FactoryBot.define do
  factory :purchase_item do
    postal_code    { '520-0013' }
    state_id       { Faker::Number.between(from: 2, to: 48) }
    city           { '久慈市' }
    address_line   { '高畑町' }
    phone_number   { '00011112222' }
    token          { 'tok_38bd6770a47tgjy887d934934131' }
  end
end
