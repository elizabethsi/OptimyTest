*** Settings ***
Resource    Optimy_Keywords.robot

*** Test Cases ***
Submit Application Test
    Given User goes to the application website
    And User logs in with credentials
    When User submits a new application
    And User fills out the forms
    And User clicks Next screen button
    Then User verifies all inputted values in the Summary screen
    And User verifies redirection to Thank you page