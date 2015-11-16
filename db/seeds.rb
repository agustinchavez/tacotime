# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name:"User",last_name:"Mann", password: "password", email:"fake@example.com", phone:"1231231234")

10.times {FactoryGirl.create(:user)}

c = Restaurant.create(name: "Nuevo Leon Restaurant", username: "cafe", address: "1515 W 18th St Chicago, IL 60608", email: "restaurant@example.com", password: 'password', neighborhood: "Pilsen")
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Birrieria Zaragoza", username: "cafe2", address: "4852 S Pulaski Rd Chicago, IL 60632", email: "restaurant2@example.com", password: 'password', neighborhood: "Archer Heights")
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Taqueria Los Comales 3", username: "cafe3", address: "1544 W 18th St Chicago, IL 60608", email: "restaurant3@example.com", username: "cafe4", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "El Milagro Tortilla", username: "cafe5", address: "1927 S Blue Island Ave Chicago, IL 60608", email: "restaurant4@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Atotonilco Restaurant", username: "cafe6", address: "3916 W 26th St Chicago, IL 60623", email: "restaurant5@example.com", password: 'password' neighborhood: "Little Village")
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Carnitas Uruapan Restaurant", username: "cafe7", address: "1725 W 18th St Chicago, IL 60608", email: "restaurant6@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "La Casa Del Pueblo", username: "cafe8", address: "1810 S Blue Island Ave Chicago, IL 60608", email: "restaurant7@example.com", password: 'password', neighborhood: "Pilsen")
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Birreria Reyes de Ocotlan", username: "cafe9", address: "1322 W 18th St Chicago, IL 60608", email: "restaurant8@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Taqueria Los Comales", username: "cafe10", address: "3141 W 26th St Chicago, IL 60623", email: "restaurant9@example.com", username: "cafe11", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "El Faro Restaurant", username: "cafe12", address: "3936 W 31st St Chicago, IL 60623", email: "restaurant10@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Birrieria Riveras Ocotolan", username: "cafe13", address: "3809 W 26th St Chicago, IL 60623", email: "restaurant10@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "La Quebrada", username: "cafe14", address: "4859 W Roosevelt Rd Cicero, IL 60804", email: "restaurant11@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Indio Restaurant", username: "cafe16", address: "6037 W Cermak Rd Cicero, IL 60804", email: "restaurant12@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Los Corrales Taqueria & Restaurant", username: "cafe17", address: "6713 W 26th St Berwyn, IL 60402", email: "restaurant13@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: " El Habanero", username: "cafe18", address: "3300 W Fullerton Ave Chicago, IL 60647", email: "restaurant14@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Pueblo Nuevo", username: "cafe19", address: "4342 N Central Ave Chicago, IL 60634", email: "restaurant15@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "L’ Patron Tacos", username: "cafe20", address: "2815 W Diversey Ave Chicago, IL 60647", email: "restaurant16@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Chilango Mexican Street Food", username: "cafe21", address: "1437 W Taylor St Chicago, IL 60607", email: "restaurant17@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "El Taco Feliz Taqueria", username: "cafe22", address: "5439 W Addison St Chicago, IL 60641", email: "restaurant18@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Dos Ricco’s", username: "cafe23", address: "6445 S Cicero Ave Chicago, IL 60638", email: "restaurant19@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

c = Restaurant.create(name: "Xoco", username: "cafe24", address: "449 N Clark St Chicago, IL 60654", email: "restaurant20@example.com", password: 'password')
5.times { c.menu_items.create(FactoryGirl.attributes_for(:menu_item)) }

Restaurant.all.each { |c| c.update_attributes(city:"Chicago")}