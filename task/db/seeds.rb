# db/seeds.rb
require 'faker'

# Create users
users = 1000.times.map do
  User.create!(username: Faker::Internet.username)
end

# Create stories
stories = 50000.times.map do
  Story.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraph,
    user: users.sample
  )
end

# Create reviews
20000.times do
  Review.create!(
    rating: rand(1..5),
    comment: Faker::Lorem.sentence,
    user: users.sample,
    story: stories.sample
  )
end
