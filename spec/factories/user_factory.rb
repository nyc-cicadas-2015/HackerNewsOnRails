FactoryGirl.define do
  factory :user do
    username  Faker::Internet.email
    password  Faker::Internet.password(8)
  end

  factory :post do
    title Faker::Lorem.word
    url Faker::Internet.url
  end

end
