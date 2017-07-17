FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence(5) }
    user
  end
end
