FactoryBot.define do
  factory :feeding_calculation do
    association :user, factory: :user
    association :brand, factory: :brand
    association :main_food, factory: :food
    association :sub_food, factory: :food
  end
end
