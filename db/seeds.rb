
User.create(first_name:"User",last_name:"Mann", password: "password", email:"fake@example.com", phone:"1231231234")

25.times {User.create( first_name: Faker::Name.first_name,
last_name:Faker::Name.last_name,    password: "password",
email:Faker::Internet.email, phone:
Random.new.rand(1_000_000_000..9_999_999_999).to_s)}

prices = [2.85, 3.45, 3.95, 3.35, 4.45, 1.75, 2.10, 3.65, 4.65, 2.35]
drinks = ["Horchata", "Lemonade", "Jarritos", "Coke", "Cafe", "Margarita", "Pina Colada", "Champurado", "Cortado", "Aguas Naturales", "Water"]

Restaurant.create(name: "Nuevo Leon Restaurant", address: "1515 W 18th St Chicago, IL 60608", email: "restaurant@example.com", password: 'password', city: "Chicago", neighborhood: "Pilsen", picture: "http://s3-media3.fl.yelpcdn.com/bphoto/ov8LvTu_b0IeaEdAMeWpkA/o.jpg")

Restaurant.create(name: "Birrieria Zaragoza", address: "4852 S Pulaski Rd Chicago, IL 60632", email: "restaurant2@example.com", password: 'password', city: "Chicago", neighborhood: "Archer Heights", picture: "http://s3-media3.fl.yelpcdn.com/bphoto/suLFSAX7XvzPG4EKU0USgg/o.jpg")


Restaurant.create(name: "Taqueria Los Comales 3", address: "1544 W 18th St Chicago, IL 60608", email: "restaurant3@example.com", password: 'password', city: "Chicago", neighborhood: "Pilsen", picture: "http://s3-media3.fl.yelpcdn.com/bphoto/5X6RhtcLhUkX7da3FGB22Q/o.jpg")


Restaurant.create(name: "El Milagro Tortilla", address: "1927 S Blue Island Ave Chicago, IL 60608", email: "restaurant4@example.com", password: 'password', city: "Chicago", neighborhood: "Pilsen", picture: "http://s3-media2.fl.yelpcdn.com/bphoto/Cqwf86dPVTl7vjvJM0SRQg/o.jpg")


Restaurant.create(name: "Atotonilco Restaurant", address: "3916 W 26th St Chicago, IL 60623", email: "restaurant5@example.com", password: 'password', city: "Chicago", neighborhood: "Little Village", picture: "http://s3-media2.fl.yelpcdn.com/bphoto/x4XDHBHip7Op1hgTO-om4Q/o.jpg")


Restaurant.create(name: "Carnitas Uruapan Restaurant", address: "1725 W 18th St Chicago, IL 60608", email: "restaurant6@example.com", password: 'password', city: "Chicago", neighborhood: "Pilsen", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/_HgvFN_lVNUpLwY1aX3TNQ/o.jpg")


Restaurant.create(name: "La Casa Del Pueblo", address: "1810 S Blue Island Ave Chicago, IL 60608", email: "restaurant7@example.com", password: 'password', city: "Chicago", neighborhood: "Pilsen", picture: "http://s3-media3.fl.yelpcdn.com/bphoto/nh5LPntH9RTv7v5VBTmQ4Q/o.jpg")


Restaurant.create(name: "Birreria Reyes de Ocotlan", address: "1322 W 18th St Chicago, IL 60608", email: "restaurant8@example.com", password: 'password', city: "Chicago", neighborhood: "Pilsen", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/EwZgSzGApRv9pNlr2WGXLA/o.jpg")


Restaurant.create(name: "Taqueria Los Comales", address: "3141 W 26th St Chicago, IL 60623", email: "restaurant9@example.com", password: 'password', city: "Chicago", neighborhood:"Little Village", picture: "http://s3-media1.fl.yelpcdn.com/bphoto/y1uQg29YweGbLwrF9OUJxw/o.jpg")


Restaurant.create(name: "El Faro Restaurant", address: "3936 W 31st St Chicago, IL 60623", email: "restaurant10@example.com", password: 'password', city: "Chicago", neighborhood:"Little Village", picture: "http://veganskateblog.com/wp-content/uploads/2012/08/El-Faro.jpg")


Restaurant.create(name: "Birrieria Riveras Ocotolan", address: "3809 W 26th St Chicago, IL 60623", email: "restaurant10@example.com", password: 'password', city: "Chicago", neighborhood:"Little Village", picture: "http://s3-media3.fl.yelpcdn.com/bphoto/awiTVStPrk621N_BovgEFQ/o.jpg")


Restaurant.create(name: "La Quebrada", address: "4859 W Roosevelt Rd Cicero, IL 60804", email: "restaurant11@example.com", password: 'password', city: "Cicero", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/3KeJPerm6djzGNBUaiSXKA/o.jpg")


Restaurant.create(name: "Indio Restaurant", address: "6037 W Cermak Rd Cicero, IL 60804", email: "restaurant12@example.com", password: 'password' city: "Cicero", picture: "http://s3-media1.fl.yelpcdn.com/bphoto/hkAnPrebAygnxjydvMsIng/o.jpg")


Restaurant.create(name: "Los Corrales Taqueria & Restaurant", address: "6713 W 26th St Berwyn, IL 60402", email: "restaurant13@example.com", password: 'password' city: "Berwyn", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/kZ5MHJWmtGszUELhTavPWg/o.jpg")


Restaurant.create(name: "El Habanero", address: "3300 W Fullerton Ave Chicago, IL 60647", email: "restaurant14@example.com", password: 'password' city: "Chicago", neighborhood: "Logan Square", picture: "http://media2.fdncms.com/chicago/imager/el-habanero/u/original/14027528/1403537015-elhabanero.jpg")


Restaurant.create(name: "Pueblo Nuevo", address: "4342 N Central Ave Chicago, IL 60634", email: "restaurant15@example.com", password: 'password' city: "Chicago", neighborhood: "Portage Park", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/3TjbVpFiIY_1Bv3EquU82Q/o.jpg")


Restaurant.create(name: "L’ Patron Tacos", address: "2815 W Diversey Ave Chicago, IL 60647", email: "restaurant16@example.com", password: 'password' city: "Chicago", neighborhood: "Logan Square", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/xnKIpX_dFIY2fwX497K_iQ/o.jpg")


Restaurant.create(name: "Chilango Mexican Street Food", address: "1437 W Taylor St Chicago, IL 60607", email: "restaurant17@example.com", password: 'password' city: "Chicago", neighborhood: "University Village", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/yR6vnUe1AF2Un59tTo_ghQ/o.jpg")


Restaurant.create(name: "El Taco Feliz Taqueria", address: "5439 W Addison St Chicago, IL 60641", email: "restaurant18@example.com", password: 'password' city: "Chicago", neighborhood: "Portage Park", picture: "https://d.zmtcdn.com/data/pictures/7/18083707/4bfee29c2fc2584ac1f55a8c1dc8bad2_featured_v2.jpg")


Restaurant.create(name: "Dos Ricco’s", address: "6445 S Cicero Ave Chicago, IL 60638", email: "restaurant19@example.com", password: 'password' city: "Chicago", neighborhood: "Clearing", picture: "http://s3-media2.fl.yelpcdn.com/bphoto/WN-99fkwirgDN3GJckk4tQ/o.jpg")


Restaurant.create(name: "Xoco", address: "449 N Clark St Chicago, IL 60654", email: "restaurant20@example.com", password: 'password' city: "Chicago", neighborhood: "Near North Side", picture: "http://s3-media4.fl.yelpcdn.com/bphoto/vYGhxrXCSSrHowoAH67NGQ/o.jpg")


Restaurant.all.each do |c|
  #this will upload to cloudinary every  time we seed. don't use while developing
  # c.picture = File.open(Rails.root + "app/assets/images/cafe.jpg")
  # c.save!
    (2..7).to_a.sample.times do
      drinks = drinks.dup.shuffle
      c.menu_items.create(name: drinks.pop, price: prices.sample)
    end
end

User.all.each do |u|
  (2..7).to_a.sample.times do
    # redeemed
    u.redeemed_gifts.create(giver: User.all.sample, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: true)
    # unredeemed
    u.unredeemed_gifts.create(giver: User.all.sample, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: false)
    # redeemed sent
    User.all.sample.redeemed_gifts.create(giver: u, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: true)
    # unredeemed sent
    User.all.sample.redeemed_gifts.create(giver: u, phone:Random.new.rand(1_000_000_000..9_999_999_999).to_s, menu_item: MenuItem.all.sample, redeemed: false)
  end
end