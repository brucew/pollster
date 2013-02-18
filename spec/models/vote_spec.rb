require 'spec_helper'

describe Vote do
  it 'should create a new instance given valid attributes' do
    FactoryGirl.create(:vote)
  end

  it 'should require an IP address' do
    vote = FactoryGirl.build(:vote, ip_address: nil)
    vote.should_not be_valid
  end

  it 'should require an item' do
    vote = FactoryGirl.build(:vote, item: nil)
    vote.should_not be_valid
  end

  it 'should be unique for the IP address per poll' do
    poll = FactoryGirl.create(:poll)
    FactoryGirl.create(:vote, item: poll.items.first, ip_address: '0.0.0.0')
    vote = FactoryGirl.build(:vote, item: poll.items.first, ip_address: '0.0.0.0')
    vote.should_not be_valid
  end

end
