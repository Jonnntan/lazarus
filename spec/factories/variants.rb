FactoryBot.define do
  factory :variant do
    sequence(:name) { |n| "Variant #{n}" }
    inventory { Random.rand(50) + 1 }
    price { Random.rand(100) + 1 }
    association :product
  end
end
