require 'spec_helper'

describe "polls/edit" do
  before(:each) do
    @poll = assign(:poll, FactoryGirl.create(:poll))
  end

  it "renders the edit poll form" do
    render

    assert_select "form", :action => polls_path(@poll), :method => "post" do
      assert_select "textarea#poll_question", :name => "poll[question]"
    end
  end
end
