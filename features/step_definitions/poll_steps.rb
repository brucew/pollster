Given /^I am a visitor$/ do
  # Nothing to do
end

Given /^there are (\d+) polls$/ do |number_of_polls|
  number_of_polls.to_i.times do
    FactoryGirl.create(:poll)
  end
end

When /^I go to the poll list page$/ do
  visit '/polls'
end

Then /^I should see a list of (\d+) polls$/ do |number_of_polls|
  pending # express the regexp above with the code you wish you had
end
