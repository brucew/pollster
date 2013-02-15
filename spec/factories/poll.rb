require "faker"

FactoryGirl.define do
  factory :poll do
    question { Faker::Lorem.paragraph }
  end
end
