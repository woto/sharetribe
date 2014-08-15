@javascript
Feature: Admin views transactions
In order to analyze and improve my community
As an admin
I want to see see all the transactions happening in my community

  Background:
     Given there are following users:
      | person            | given_name | family_name | email               | membership_created_at     |
      | manager           | matti      | manager     | manager@example.com | 2014-03-01 00:12:35 +0200 |
      | kassi_testperson1 | john       | doe         | test2@example.com   | 2013-03-01 00:12:35 +0200 |
      | kassi_testperson2 | jane       | doe         | test1@example.com   | 2012-03-01 00:00:00 +0200 |
    And there are following transactions
      | listing     | status  | sum | currency | started_at  | latest_activity | starter           | other_party       |
      | Moving help | pending | 127 | EUR      | 2 days ago  | 3 hours ago     | kassi_testperson1 | kassi_testperson2 |
      | Red apples  | paid    | 60  | USD      | 1 week ago  | 2 hours ago     | kassi_testperson2 | kassi_testperson1 |
      | Power drill | free    |     |          | 2 hours ago | 1 hour ago      | kassi_testperson1 | kassi_testperson2 |
      | nil         | free    |     |          | 1 year ago  | 5 hours ago     | kassi_testperson1 | kassi_testperson2 |
      | Moving help | pending | 127 | EUR      | 4 days ago  | 3 hours ago     | nil               | kassi_testperson2 |
      | Moving help | pending | 127 | EUR      | 3 days ago  | 2 days ago      | kassi_testperson1 | nil               |
      | Moving help | pending | 127 | EUR      | 3 days ago  | 2 days ago      | nil               | nil               |
    And I am logged in as "manager"
    And "manager" has admin rights in community "test"
    And I am on the transactions admin page

  Scenario: Admin views all transactions
    Then I should see 2 transaction with status "Free conversation"
    And I should see 4 transaction with status "Pending"
    And I should see 1 transaction with status "Paid"

  Scenario: Admin sorts transactions by listing
    When I sort by "listing"
    Then I should see the transactions in ascending order by "listing"
    When I sort by "listing"
    Then I should see the transactions in descending order by "listing"

  Scenario: Admin sorts transactions by start date
    When I sort by "started"
    Then I should see the transactions in ascending time order by "started"
    When I sort by "started"
    Then I should see the transactions in descending time order by "started"

  Scenario: Admin sorts transactions by latest activity
    When I sort by "latest activity"
    Then I should see the transactions in ascending time order by "latest activity"
    When I sort by "latest activity"
    Then I should see the transactions in descending time order by "latest activity"



