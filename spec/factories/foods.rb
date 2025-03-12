FactoryBot.define do
  factory :food do
    name { "キャットフードA" }
    association :brand # brand を関連付ける
  end
end
