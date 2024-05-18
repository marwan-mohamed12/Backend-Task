FactoryBot.define do
  factory :review do
    comment { Faker::Lorem.sentence }
    rating { rand(1..5) }
    story
    user
  end
end
