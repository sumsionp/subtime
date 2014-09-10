Feature: Count down

  As a command line user
  In order to know timer progress
  I want to see the count down output of my timer

  Scenario: Count down from 10

    When I run `timer -m 10 --notime`
    Then the output should contain "10\n9\n8\n7\n6\n5\n4\n3\n2\n1\n"
