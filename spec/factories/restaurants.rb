FactoryGirl.define do
 factory :restaurant do
   name { Faker::Company.name }
   address {
     "#{Faker::Address.street_address},
     #{Faker::Address.city},
     #{Faker::Address.state_abbr},
     #{Faker::Address.zip}"
   }
   password "password"
   email { Faker::Internet.email }
 end
end