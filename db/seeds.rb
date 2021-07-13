# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "ky19930305@gmail.com",
  password: "uverworld"
  )
  
 15.times do |n|
 Customer.create!(
      email: "test#{n + 1}@test.com",
      last_name: "テスト#{n + 1}",
      first_name: "太郎#{n + 1}",
      password: "111111",
      is_active: "true",
      postal_code: "000-0000",
      address: "東京都xxx-xxxx",
      telephone_number: "000-000-0000"
    )
  15.times do |n|
    .create!(
      email: "test#{n + 1}@test.com",
      name: "テスト太郎#{n + 1}",
    )
  end
  end