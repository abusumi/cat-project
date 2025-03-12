FactoryBot.define do
  factory :bookmark do
    association :user
    association :food
  end
end
