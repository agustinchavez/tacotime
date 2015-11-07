FactoryGirl.define do
  factory :restaurant do
    name "Taqueria Los Comales"
    address "3141 W 26th St, Chicago, IL 60623"
    password "password"

    sequence :username do |n|
      "user#{n}"
    end

    sequence :email do |n|
      "restaurant#{n}@example.com"
    end

    factory(:invalid_cafe) do
        username nil
        email nil
    end
  end
end