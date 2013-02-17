Feature: Polls
  In order to get feedback on questions
  Visitors should be able to manage polls and vote on polls

  @javascript
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
    Given there is an existing poll
    And my IP address does not match any votes on that poll
    When I view that poll
    Then the voting results should not be shown
    When I vote for an item
    Then the votes for that item should increment by 1

  Scenario: View results of a poll
    Given there is an existing poll
    And my IP address matches a vote on that poll
    When I view that poll
    Then the voting results should be shown
    And I should not be able to vote on that poll

