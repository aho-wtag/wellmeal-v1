
FactoryBot.define do
  factory :preference do
    restricted_food {Faker::Food.allergen}
    association :user
  end
end
