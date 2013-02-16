Given /^I am on the poll list page$/ do
  visit '/polls'
end

Given /^there is an existing poll$/ do
  @poll = FactoryGirl.create(:poll)
end

When /^I create a new poll$/ do
  click_on 'new_poll_button'

  @new_poll = FactoryGirl.build(:poll)
  fill_in 'poll_question', with: @new_poll.question

  click_on 'poll_submit_button'
end

When /^I edit that poll$/ do
  click_on "edit_poll_#{@poll.id}_button"

  @edited_poll = FactoryGirl.build(:poll)
  fill_in 'poll_question', with: @edited_poll.question

  click_on 'poll_submit_button'
end

Then /^that poll should exist$/ do
  poll = Poll.where(question: @new_poll.question).first
  poll.should_not be_nil
end

Then /^that poll should be updated with my changes$/ do
  updated_poll = Poll.where(question: @edited_poll.question).first
  updated_poll.should_not be_nil
  updated_poll.question.should_not eq @poll.question
  updated_poll.question.should eq @edited_poll.question
end
