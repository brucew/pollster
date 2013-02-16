Given /^I am a visitor$/ do
  # Nothing to do
end

When /^I visit the poll list page$/ do
  visit '/polls'
end

Then /^I should be able to create a new poll$/ do
  click_on 'new_poll_button'

  new_poll = FactoryGirl.build(:poll)
  fill_in 'poll_question', with: new_poll.question

  click_on 'poll_submit_button'

  created_poll = Poll.where(question: new_poll.question)
  created_poll.should_not be_nil
end
