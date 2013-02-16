require 'spec_helper'

describe "polls/new" do
  before(:each) do
    assign(:poll, FactoryGirl.build(:poll))
  end

  it "renders new poll form" do
    render
    assert_select "form", :action => polls_path, :method => "post" do
      assert_select "textarea#poll_question", :name => "poll[question]"
    end
  end
end
