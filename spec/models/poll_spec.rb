require 'spec_helper'

describe Poll do
  before(:each) do
    @attrs = FactoryGirl.attributes_for(:poll)
  end

  it "should create a new instance given valid attributes" do
    Poll.create!(@attrs)
  end

end