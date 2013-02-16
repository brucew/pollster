require 'spec_helper'

describe "polls/index" do
  before(:each) do
    assign(:polls, [FactoryGirl.build(:poll), FactoryGirl.build(:poll)])
  end

  it "renders a list of polls" do
    render
    assert_select 'p', :text => /^##Question##  /, :count => 2
    assert_select "a[href=#{new_poll_path}]"
  end
end
