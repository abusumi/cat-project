FactoryBot.define do
  factory :cat do
    association :user
    name { Faker::Creature::Cat.name[0...20] }
    cat_introduction { Faker::Lorem.sentence(word_count: 10) }
  end
end
