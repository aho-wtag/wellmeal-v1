
require 'faker'
FactoryBot.define do
  factory :menu do
    meal_date { Date.today }
    association :user
    trait :lunch do
      meal_type { 0 }
    end

    trait :snack do
      meal_type { 1 }
    end
    after(:build) do |menu|
      menu.dish << FactoryBot.build(:dish)
    end
  end
end
