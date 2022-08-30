# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "test_admin", email: "test_admin@gmail.com", password: "000000", password_confirmation: "000000", admin: true)

10.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    name: "test_User#{n + 1}",
    password: "000000",
    password_confirmation: "000000",
    admin: false
  )
end

3.times do |n|
  Task.create!(
    title: "Task#{n + 1}",
    content: "task_content#{n + 1}",
    deadline: "2022-09-01",
    status: "未着手",
    priority: "高"
  )
end

3.times do |n|
  Task.create!(
    title: "Task#{n + 4}",
    content: "task_content#{n + 1}",
    deadline: "2022-09-15",
    status: "着手中",
    priority: "中"
  )
end

3.times do |n|
  Task.create!(
    title: "Task#{n + 7}",
    content: "task_content#{n + 1}",
    deadline: "2022-09-30",
    status: "完了",
    priority: "低"
  )
end

10.times do |n|
  Label.create!(
    name: "Label#{n + 1}"
  )
end
