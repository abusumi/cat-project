FactoryBot.define do
  factory :review do
    association :user
    association :food
  end
end
