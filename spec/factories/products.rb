FactoryBot.define do
  factory :product do
    # sequence(:id) { |n| "#{n}" }
    sequence(:title) { |n| "Test product #{n}" }
    price { 28 }
    description { 'This is a test product' }
    association :brand
  end
end