require 'faker'

FactoryGirl.define do
  factory :item do
    association :poll
    answer { '##Answer##  ' + Faker::Lorem.sentence }
  end
end
