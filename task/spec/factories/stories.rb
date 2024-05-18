FactoryBot.define do
  factory :story do
    title { Faker::Book.title }
    body { Faker::Lorem.paragraph(sentence_count: 5) }
    user
  end
end
