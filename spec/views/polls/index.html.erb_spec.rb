require 'spec_helper'

describe "polls/index" do
  before(:each) do
    @polls = assign(:polls, FactoryGirl.build_list(:poll, 2, id: 1))
  end

  it "renders a list of polls with edit and delete buttons" do
    render
    assert_select 'tr.poll', :text => /^##Question##  /, :count => @polls.count
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
