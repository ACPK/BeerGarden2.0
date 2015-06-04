# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

10.times do
  User.create(username: Faker::Internet.user_name,
              password: "123456789",
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              location: Faker::Address.state)
end

categories = ["IPA", "Stout", "Pale Ale", "Amber", "Wheat Beer", "Cider"]

10.times do
  Beer.create(name: Faker::Lorem.word,
              category: categories.sample,
              alc_percent: Faker::Number.digit,
              description: Faker::Lorem.sentence(3),
              user_id: User.all.sample.id)
end

10.times do
  Comment.create(content: Faker::Lorem.sentence(3),
                user_id: User.all.sample.id,
                beer_id: Beer.all.sample.id)
end

