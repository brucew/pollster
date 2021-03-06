require 'spec_helper'

describe Poll do
  it 'should create a new instance given valid attributes' do
    FactoryGirl.create(:poll)
  end

  it 'should require a question' do
    poll = FactoryGirl.build(:poll, question: nil)
    poll.should_not be_valid
  end

  it 'should require 2 to 5 items' do
    poll = FactoryGirl.build(:poll, items_count: 1)
    poll.should_not be_valid
    poll = FactoryGirl.build(:poll, items_count: 2)
    poll.should be_valid
    poll = FactoryGirl.build(:poll, items_count: 3)
    poll.should be_valid
    poll = FactoryGirl.build(:poll, items_count: 4)
    poll.should be_valid
    poll = FactoryGirl.build(:poll, items_count: 5)
    poll.should be_valid
    poll = FactoryGirl.build(:poll, items_count: 6)
    poll.should_not be_valid
  end

  it 'should return whether a vote has been cast from a given IP address' do
    poll = FactoryGirl.create(:poll)
    poll.voted_on_from?('0.0.0.0').should be_false
    FactoryGirl.create(:vote, ip_address: '0.0.0.0', item: poll.items.first)
    poll.voted_on_from?('0.0.0.0').should be_true
  end

  it 'should destroy its items when it is destroyed' do
    poll = FactoryGirl.create(:poll)
    3.times { FactoryGirl.create(:item, poll: poll) }
    poll.items.count.should eq 5
    poll.reload
    poll.destroy
    poll.items.count.should eq 0
  end

end