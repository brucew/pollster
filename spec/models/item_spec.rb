require 'spec_helper'

describe Item do
  before(:each) do
    @attrs = FactoryGirl.attributes_for(:item)
  end

  it "should create a new instance given valid attributes" do
    Item.create!(@attrs)
  end

  it "should require an answer" do
    item = FactoryGirl.build(:item, answer: nil)
    item.should_not be_valid
  end

end
