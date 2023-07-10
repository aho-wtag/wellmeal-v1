

require 'faker'
FactoryBot.define do
  factory :dish do
    name { Faker::Food.dish }
    ingredients { Faker::Food.ingredient }
  end
end
