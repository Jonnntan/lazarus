FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Test product #{n}" }
    sequence(:price) { rand() }
  end
end