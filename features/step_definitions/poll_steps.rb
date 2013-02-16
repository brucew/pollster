Given /^I visit the poll list page$/ do
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

When /^I delete that poll$/ do
  click_on "delete_poll_#{@poll.id}_button"
end

Then /^that poll should exist$/ do
  poll = Poll.where(question: @new_poll.question).first
  poll.should_not be_nil
end

Then /^that poll should be updated with my changes$/ do
  poll = Poll.find(@poll.id)
  poll.should_not be_nil
  poll.question.should_not eq @poll.question
  poll.question.should eq @edited_poll.question
end

Then /^that poll should not exist$/ do
  polls = Poll.where(id: @poll.id)
  polls.should be_empty
end
