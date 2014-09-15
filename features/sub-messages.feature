Feature: Sub-messages are given

  As a command line user
  In order to sub-time a process
  I want to hear sub-messages at certain points during the timer

  Scenario:

    Given the default aruba timeout is 5 seconds
    When I run `subtime -m 7 -s 5,"Minute five",4,"Minute four",2,"Minute two" --notime`
    Then I should hear "Minute five", "Minute four", "Minute two"
