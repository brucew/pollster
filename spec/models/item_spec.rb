require 'spec_helper'

describe Item do
  it 'should create a new instance given valid attributes' do
    FactoryGirl.create(:item)
  end

  it 'should require an answer' do
    item = FactoryGirl.build(:item, answer: nil)
    item.should_not be_valid
  end

  it 'should require a poll' do
    item = FactoryGirl.build(:item, poll: nil)
    item.should_not be_valid
  end

  it 'should destroy its votes when it is destroyed' do
    item = FactoryGirl.create(:item)
    5.times { FactoryGirl.create(:vote, item: item) }
    item.votes.count.should eq 5
    item.destroy
    item.votes.count.should eq 0
  end

end
