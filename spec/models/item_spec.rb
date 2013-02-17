require 'spec_helper'

describe Item do
  it "should create a new instance given valid attributes" do
    FactoryGirl.create(:item)
  end

  it "should require an answer" do
    item = FactoryGirl.build(:item, answer: nil)
    item.should_not be_valid
  end

end
