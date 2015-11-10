FactoryGirl.define do

 factory :gift do
   message {Faker::Lorem.paragraph}
 end

end