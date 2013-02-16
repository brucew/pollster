require 'spec_helper'

describe "polls/index" do
  before(:each) do
    @polls = [
        FactoryGirl.build(:poll, id: 1),
        FactoryGirl.build(:poll, id: 2)
    ]
  end

  it "renders a list of polls with edit and delete buttons" do
    render
    assert_select 'div.poll', :text => /^##Question##  /, :count => @polls.count
    @polls.each do |poll|
      assert_select "a[href='#{edit_poll_path(poll)}']"
      assert_select "a[href='#{poll_path(poll)}'][data-method='delete']"
    end
  end

  it "renders a new poll button" do
    render
    assert_select "a[href='#{new_poll_path}']"
  end
end
