require 'spec_helper'

describe Vote do
  it "should create a new instance given valid attributes" do
    FactoryGirl.create(:vote)
  end

  it "should require an ip_address" do
    vote = FactoryGirl.build(:vote, ip_address: nil)
    vote.should_not be_valid
  end

  it "should require an item" do
    vote = FactoryGirl.build(:vote, item: nil)
    vote.should_not be_valid
  end

end
