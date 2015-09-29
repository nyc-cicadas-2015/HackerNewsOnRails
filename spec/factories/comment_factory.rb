FactoryGirl.define do

  factory :comment do
    content Faker::Lorem.paragraph
    post
    association :user, factory: :new_user
  end

end
