FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'qwerty123'
  end
end
