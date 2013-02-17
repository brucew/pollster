require 'faker'

FactoryGirl.define do
  factory :item do
    association :poll, strategy: :build
    answer { '##Answer##  ' + Faker::Lorem.sentence }
  end
end
