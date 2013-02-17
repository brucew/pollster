require 'spec_helper'

describe Vote do
  before(:each) do
    @attrs = FactoryGirl.attributes_for(:vote)
  end

  it "should create a new instance given valid attributes" do
    Vote.create!(@attrs)
  end

  it "should require an ip_address" do
    vote = FactoryGirl.build(:vote, ip_address: nil)
    vote.should_not be_valid
  end

end
