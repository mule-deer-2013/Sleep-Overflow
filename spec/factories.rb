
FactoryGirl.define do 
  factory :question do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
  end

  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password_hash { "password" }
  end
end
