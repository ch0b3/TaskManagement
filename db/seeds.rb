# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "name",
  email: "email",
  password: "password",
  admin: true
)

Status.create!(
  id: 1,
  name: "完了"
)
Status.create!(
  id: 2,
  name: "着手中"
)
Status.create!(
  id: 3,
  name: "未着手"
)

Priority.create!(
  id: 1,
  value: "高"
)
Priority.create!(
  id: 2,
  value: "中"
)
Priority.create!(
  id: 3,
  value: "低"
)
