# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{name: "Abe", email: "Aberudy@gmail.com", password: "passcode"}, {name: "Todd", email: "Tohanion@gmail.com", password: "yourpassword"}, {name: "Shirley", email: "SLin@gmail.com,", password: "password"}])
Location.create(address1: "123 Whatever Street", city_state: "Brooklyn, NY", zip: 11230)
Event.create(title: "My Birthday",  date: Date.today, location_id: 1, admittance: true )
