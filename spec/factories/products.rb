FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Test product #{n}" }
    price { Random.rand(99) + 1 }
    description { 'This is a product' }
    association :brand
  end
end