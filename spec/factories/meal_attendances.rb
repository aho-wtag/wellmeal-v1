FactoryBot.define do
  factory :meal_attendance do
    meal_date{Faker::Time.between(from: Date.today, to: Date.today + 1.year)}
    association :user

    trait :lunch do
      meal_type { 0 }
    end

    trait :snack do
      meal_type { 1 }
    end
  end
end
