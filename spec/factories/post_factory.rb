FactoryGirl.define do

  factory :post do
    title Faker::Lorem.word
    url Faker::Internet.url
    association :user, factory: :new_user
  end

end
