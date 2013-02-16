Feature: Polls
  In order to get feedback on questions
  Visitors should be able to manage polls and vote on polls

  Scenario: Create poll
    Given I am a visitor
    When I visit the poll list page
    Then I should be able to create a new poll

  Scenario: Update poll
    Given I am a visitor
    When I visit the poll list page
    Then I should be able to edit a poll

  Scenario: Delete poll
    Given I am a visitor
    When I visit the poll list page
    Then I should be able to delete a poll

  Scenario: Vote on a poll
    Given I am a visitor
    And my IP address does not match any votes on a poll
    When I view that poll
    Then the voting results should not be shown
    But there should be a vote button for each item
    And when I click the vote button for an item
    Then a vote for that item should be created
    And it should include my IP address

  Scenario: View results of a poll
    Given I am a visitor
    And my IP address matches a vote on a poll
    When I view that poll
    Then the voting results should be shown
    But there should not be any voting buttons for the items

