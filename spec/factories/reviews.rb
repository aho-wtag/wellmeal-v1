FactoryBot.define do
  factory :review do
    review_body{Faker::Lorem.paragraph}
    rating{Faker::Number.between(from: 1, to: 5)}
    association :user
    association :menu
  end
end
