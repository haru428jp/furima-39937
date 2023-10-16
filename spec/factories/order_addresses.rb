FactoryBot.define do
  factory :order_address do
    zip_code      { Faker::Number.binary(digits: 3) + '-' + Faker::Number.binary(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    block         { Faker::Address.street_address }
    building      { Faker::Address.building_number }
    phone_number  { Faker::Number.decimal_part(digits: 11) }
    token         { Faker::Internet.password(min_length: 25, max_length: 35) }
  end
end
