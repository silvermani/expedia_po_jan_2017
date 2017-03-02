#Feature: expedia hotel search
#
#  Background:
#    Given user is on expedia home page.
#    When user selects hotels tab on home page.
#  #Imperative
#
#  Scenario: verify the user gets an error message when searching for a past date for booking hotel
#    And user selects Columbus, OH destination for the hotel in city columbus in the Going to field
#    And user enters 09/14/2016 in the check-in field
#    And user enters 09/15/2016 in the check-out field
#    And user searches for the available hotel results by clicking search button.
#    Then verify the The start or end date is prior to the current date. messege is displayed
#

  #Declarative
#
#  Scenario: verify the user gets an error message when searching for a past date for booking hotel..
#    When user searches for the past date hotel booking
#    Then verify the user is warned with the error message
#
#
#  Scenario Outline: verify the user gets available hotel search when user searches for Going to
#    And user selects <user_destination> destination for the hotel in city <going_to> in the Going to field
#    And user enters <checkin_date> in the check-in field
#    And user enters <checkout_date> in the check-out field
#    Then verify the user gets the header with destination details
#    Examples:
#      | going_to | user_destination  | checkin_date | checkout_date |
#      | Columbus | Columbus, Ohio    | 09/17/2016   | 09/18/2016    |
#      | Chicago  | Chicago, Illinois | 09/18/2016   | 09/19/2016    |
#
#  #Inline Table
#
#  Scenario: verify the user gets an error message when searching for hotel booking with no data
#    And user searches for the available hotel results by clicking search button.
#    Then verify the <error_messege> messege is displayed
#      | Please complete the highlighted destination field below. |
