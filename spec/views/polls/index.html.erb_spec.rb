require 'spec_helper'

describe "polls/index" do
  before(:each) do
    assign(:polls, [FactoryGirl.build(:poll), FactoryGirl.build(:poll)])
  end

  it "renders a list of polls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "p", :text => /^##Question##  /, :count => 2
  end
end
