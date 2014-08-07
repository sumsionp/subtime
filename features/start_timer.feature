Feature: Start Timer

  As a terminal junkie
  I would like to start a command line timer

  Scenario: Start a simple timer

    When I run `timer -m 10`
    Then it should output "Starting timer for 10 minutes..."
