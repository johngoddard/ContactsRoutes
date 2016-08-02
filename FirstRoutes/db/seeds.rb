# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username:"john")
User.create!(username:"jesson")

Contact.create!(name: "Snax", email: "snax@aa.io")
Contact.create!(name: "Mittens", email:"mit@petco.io", user_id: 2, favorite: false)
