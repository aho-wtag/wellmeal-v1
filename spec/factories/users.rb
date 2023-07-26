

require 'faker'
FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone { '+8801751031760' }
    valid_password = Faker::Internet.password(min_length: 8, max_length: 40, mix_case: true,
                                              special_characters: true)
    password { valid_password }
    password_confirmation { valid_password }

    trait :admin do
      role { 1 }
    end

    trait :user do
      role { 0 }
    end
  end
end
