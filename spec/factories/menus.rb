
require 'faker'
FactoryBot.define do
  factory :menu do
    meal_date { Date.today }
    association :user
    association :dish
    trait :lunch do
      meal_type { 0 }
    end

    trait :snack do
      meal_type { 1 }
    end
  end
end
