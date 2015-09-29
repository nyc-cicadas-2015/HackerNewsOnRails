FactoryGirl.define do
  factory :user do
    username  Faker::Internet.email
    password  Faker::Internet.password(8)
  end

  factory :new_user, class: User do
    username { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end

  factory :post do
    title Faker::Lorem.word
    url Faker::Internet.url
    association :user, factory: :new_user
  end

  factory :comment do
    content Faker::Lorem.paragraph
    post
    association :user, factory: :new_user
  end

end
