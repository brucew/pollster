require 'spec_helper'

describe Poll do
  before(:each) do
    @attrs = FactoryGirl.attributes_for(:poll)
    @attrs[:items_attributes] = { '0' => FactoryGirl.attributes_for(:item), '1' => FactoryGirl.attributes_for(:item) }
  end

  it "should create a new instance given valid attributes" do
    Poll.create!(@attrs)
  end

  it "should require a question" do
    poll = FactoryGirl.build(:poll, question: nil)
    poll.should_not be_valid
  end

  it "should require 2 to 5 items" do
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

end