FactoryBot.define do
  factory :cat do
    association :user
    name { Faker::Creature::Cat.name }
    cat_introduction { Faker::Lorem.sentence(word_count: 10) }
  end
end
