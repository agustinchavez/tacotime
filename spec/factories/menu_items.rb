FactoryGirl.define do
  factory :menu_item do
    name {
      ("#{Faker::App.name} #{['taco', 'torta', 'burrito', 'huevos rancheros', 'horchata'].sample}")
    }
    price { [1.50, 3.00, 2.50, 3.00, 1.00, 1.75, 2.00, 2.45, 3.40, 2.15].sample }

    factory :invalid_menu_item do
      name nil
      price nil
    end
  end
end