
FactoryBot.define do
  factory :notice do
    notice_title{Faker::Lorem.sentence(word_count: 4, supplemental: false, random_words_to_add: 6)}
    notice_body{Faker::Lorem.paragraph(sentence_count: 10)}
    created_at{Faker::Date.forward(days: 30)}
    association :user

    end
  end

