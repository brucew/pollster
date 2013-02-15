Feature: Polls
  In order to get feedback on questions
  Visitors should be able to manage polls and vote on polls

  Scenario: Create poll
    Given I am a visitor
    When I go to the poll list page
    Then there should be a new poll button
    When I click the new poll button
    And I complete and submit the new poll form
    Then that poll should be created
    And it should have a question
    And it should have 2-5 items

  Scenario: Update poll
    Given I am a visitor
    When I go to the poll list page
    Then there should be an edit poll button for each poll
    When I click an edit poll button for a poll
    And I complete and submit the edit poll form
    Then that poll should be updated with the new information

  Scenario: Delete poll
    Given I am a visitor
    When I go to the poll list page
    Then there should be a delete poll button for each poll
    When I click a delete poll button for a poll
    Then that poll should be deleted

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

