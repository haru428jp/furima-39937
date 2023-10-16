FactoryBot.define do
  factory :order_address do
    item_id { Faker::Number.non_zero_digit }
    user_id { Faker::Number.non_zero_digit }
    zip_code      { Faker::Number.binary(digits: 3) + "-" + Faker::Number.binary(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { Faker::Address.city }
    block         { Faker::Address.street_address }
    building      { Faker::Address.building_number }
    phone_number  { Faker::Number.decimal_part(digits: 11) }
  end
end
