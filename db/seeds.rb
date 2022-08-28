# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "code", email: "code@gmail.com", password: "000000", password_confirmation: "000000", admin: false)
User.create!(name: "manami", email: "manami@gmail.com", password: "000000", password_confirmation: "000000", admin: false)
User.create!(name: "bay", email: "bay@gmail.com", password: "000000", password_confirmation: "000000", admin: true)
