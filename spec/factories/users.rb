FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password123" }
    uid { Faker::Internet.uuid }
    provider { "google_oauth2" }
  end
end
