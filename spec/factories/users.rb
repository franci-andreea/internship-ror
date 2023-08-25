FactoryBot.define do
  factory :user do
    name { Faker::User.name }
    email { Faker::User.email }
    role { "user" }
  end
end
