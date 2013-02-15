require 'faker'

FactoryGirl.define do
  factory :poll do
    question { '##Question##  ' + Faker::Lorem.paragraph }
  end
end
