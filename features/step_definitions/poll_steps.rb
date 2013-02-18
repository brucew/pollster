Given /^I visit the poll list page$/ do
  visit polls_path
end

Given /^there is an existing poll$/ do
  @poll = FactoryGirl.create(:poll)
end

Given /^my IP address does not match any votes on that poll$/ do
  # @poll is new, no votes, nothing to do
end

Given /^my IP address matches a vote on that poll$/ do
  FactoryGirl.create(:vote, item: @poll.items.first, ip_address: '127.0.0.1')
end

When /^I create a new poll$/ do
  click_on 'new_poll_button'

  @new_poll = FactoryGirl.build(:poll)
  fill_in 'poll_question', with: @new_poll.question

  @new_poll.items.each_index do |i|
    all('input[name$="[answer]"]')[i].set(@new_poll.items[i].answer)
  end

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

When /^I view that poll$/ do
  visit poll_path(@poll)
end

When /^I vote for an item$/ do
  @item = @poll.items.first
  @item_votes_count = @item.votes.count
  click_on "create_item_#{@item.id}_vote_button"
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

Then /^the voting results should not be shown$/ do
  page.should have_no_selector '.voting_results'
end

Then /^the votes for that item should increment by (\d+)$/ do |increment|
  @item.votes.count.should eq @item_votes_count + increment.to_i
end

Then /^the voting results should be shown$/ do
  page.should have_selector '.voting_results'
end

Then /^I should not be able to vote on that poll$/ do
  page.should have_no_selector '[id$="_vote_button"]'
end
