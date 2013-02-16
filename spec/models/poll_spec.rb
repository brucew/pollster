require 'spec_helper'

describe Poll do
  before(:each) do
    @attrs = FactoryGirl.attributes_for(:poll)
  end

  it "should create a new instance given valid attributes" do
    Poll.create!(@attrs)
  end

  it "should require a question" do
    poll = FactoryGirl.build(:poll, question: nil)
    poll.should_not be_valid
  end

end