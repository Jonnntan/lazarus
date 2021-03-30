FactoryBot.define do
  factory :brand do
    # sequence(:id) { |n| "#{n}" }
    sequence(:name) { |n| "Brand #{n}" }
  end
end
