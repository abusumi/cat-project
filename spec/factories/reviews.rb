FactoryBot.define do
  factory :review do
    rating { rand(1..5) }
    association :user
    association :food
  end
  trait :with_reviews do
    after(:create) do |food|
      create_list(:review, 2, food: food)
    end
  end
end
