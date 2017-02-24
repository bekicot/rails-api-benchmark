# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yana = User.where(email: 'yana.developer@gmail.com').first_or_initialize
yana.assign_attributes(
  password: 123123123,
  password_confirmation: 123123123
)
yana.save!
