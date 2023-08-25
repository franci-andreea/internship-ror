# :name, :price, :vegetarian, :category, :description
FactoryBot.define do
  factory :product do
    name { Faker::Product.name }
    price { Faker::Product.price }
    vegetarian { false }
    category { "second_course" }
    description { Faker::Lorem.paragraph }
  end
end
