# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: 'anonymous', password: "password")

10.times do
  User.create(username: Faker::Internet.user_name, password: "password")
end

10.times do
  adress_string = "#{Faker::Address.street_address},
     #{Faker::Address.city},
     #{Faker::Address.state_abbr},
     #{Faker::Address.zip}"

  restaurant = Restaurant.create(name: Faker::Hacker.abbreviation + ' Restaurant', address: adress_string, username: Faker::Internet.first_name, email: Faker::Internet.email, password: 'password')
  5.times do
      restaurant.menu_items.create(name: (Faker::App.name+' '+['Taco', 'Torta', 'Burrito', 'Sope', 'Enchilada'].sample), price: rand(2..5))
  end
end