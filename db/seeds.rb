# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin", email: "admin@gmail.com", password: "000000", password_confirmation: "000000", admin: false)
User.create!(name: "manami", email: "manami@gmail.com", password: "000000", password_confirmation: "000000", admin: false)
User.create!(name: "bay", email: "bay@gmail.com", password: "000000", password_confirmation: "000000", admin: true)

10.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "test_User#{n + 1}",
    password: "000000"
    password_confirmation: "000000",
    admin: false
  )
end

10.times do |n|
  Task.create!(
    name: "Task#{n + 1}",
  )
end

10.times do |n|
  Label.create!(
    name: "Label#{n + 1}",
  )
end
