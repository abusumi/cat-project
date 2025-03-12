FactoryBot.define do
  factory :food do
    name { Faker::Food.dish }
    external_url { Faker::Internet.url }
    association :brand
  end
end
