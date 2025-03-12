FactoryBot.define do
  factory :review do
    rating { rand(1..5) }
    association :user
    association :food
  end
end
