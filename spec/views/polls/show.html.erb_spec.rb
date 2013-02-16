require 'spec_helper'

describe "polls/show" do
  before(:each) do
    @poll = assign(:poll, stub_model(Poll,
      :question => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
