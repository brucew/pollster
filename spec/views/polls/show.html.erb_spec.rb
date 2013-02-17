require 'spec_helper'

describe "polls/show" do
  before(:each) do
    @poll = assign(:poll, FactoryGirl.create(:poll))
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/#{@poll.question}/)
  end
end
