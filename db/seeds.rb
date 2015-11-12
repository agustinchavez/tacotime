# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

address_string = "#{Faker::Address.street_address},
                  #{Faker::Address.city},
                  #{Faker::Address.state_abbr},
                  #{Faker::Address.zip}"

User.create(username: 'user', password: "password")
Restaurant.create(name: "restaurant" + ' restaurant', address: address_string, username: "restaurant", email: Faker::Internet.email, password: 'password').menu_items.create(FactoryGirl.attributes_for(:menu_item))

10.times {FactoryGirl.create(:user)}

10.times do
  restaurant = FactoryGirl.create(:restaurant)
  5.times { restaurant.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }
end