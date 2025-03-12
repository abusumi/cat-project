FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    association :brand
  end
end
