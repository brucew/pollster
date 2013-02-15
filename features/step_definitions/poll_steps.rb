Given /^I am a visitor$/ do
  # Nothing to do
end

Given /^there are (\d+) polls$/ do |number_of_polls|
  number_of_polls.to_i.times do
    FactoryGirl.create(:poll)
  end
end

