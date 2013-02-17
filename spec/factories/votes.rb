require 'faker'

FactoryGirl.define do
  factory :vote do
    association :item, strategy: :build
    ip_address { Faker::Internet.ip_v4_address }
  end
end
