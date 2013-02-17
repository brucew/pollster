require 'spec_helper'

describe Vote do
  before(:each) do
    @attrs = FactoryGirl.attributes_for(:vote)
    @attrs.delete(:ip_address)
  end

  it "should create a new instance given valid attributes" do
    vote = Vote.new(@attrs)
    vote.ip_address = FactoryGirl.build(:vote).ip_address
    vote.save!
  end

  it "should require an ip_address" do
    vote = FactoryGirl.build(:vote, ip_address: nil)
    vote.should_not be_valid
  end

end
