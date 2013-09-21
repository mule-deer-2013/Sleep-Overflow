
FactoryGirl.define do 
  factory :question do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end

  factory :answer do
    content { Faker::Lorem.paragraph }
  end

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { "password" }
  end
end
