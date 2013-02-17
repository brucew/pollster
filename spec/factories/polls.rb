require 'faker'

FactoryGirl.define do
  factory :poll do
    ignore do
      items_count 2
    end

    question { '##Question##  ' + Faker::Lorem.paragraph }

    after(:build) do |poll, evaluator|
      poll.items << FactoryGirl.build_list(:item, evaluator.items_count, poll: poll)
    end

  end
end
