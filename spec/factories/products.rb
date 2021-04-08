FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Test product #{n}" }
    description { 'This is a product' }
    association :brand
  end
end