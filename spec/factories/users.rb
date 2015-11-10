FactoryGirl.define do

  factory :user do
    first_name {Faker::Name.name}
    email {Faker::Internet.email}
    phone Random.new.rand(1_000_000_000..9_999_999_999)
    password "supersecure"
  end

end