require 'spec_helper'

describe "polls/edit" do
  before(:each) do
    @poll = assign(:poll, stub_model(Poll,
      :question => "MyText"
    ))
  end

  it "renders the edit poll form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => polls_path(@poll), :method => "post" do
      assert_select "textarea#poll_question", :name => "poll[question]"
    end
  end
end
