FactoryGirl.define do
  factory :restaurant do
    name { "#{Faker::App.name} Restaurant" }
    address {
      "#{Faker::Address.street_address},
      #{Faker::Address.city},
      #{Faker::Address.state_abbr},
      #{Faker::Address.zip}"
    }
    password "password"
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    neighborhood {Faker::Address.city}
    city {Faker::Address.city}
  end
end