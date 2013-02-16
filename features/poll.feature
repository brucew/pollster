Feature: Polls
  In order to get feedback on questions
  Visitors should be able to manage polls and vote on polls

  Scenario: Create poll
    When I visit the poll list page
    And I create a new poll
    Then that poll should exist

  Scenario: Update poll
    Given there is an existing poll
    When I visit the poll list page
    And I edit that poll
    Then that poll should be updated with my changes

  Scenario: Delete poll
    Given there is an existing poll
    When I visit the poll list page
    And I delete that poll
    Then that poll should not exist

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

