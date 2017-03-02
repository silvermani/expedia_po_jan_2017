@expedia_search
Feature: Expedia Flight Search

  Background:
    Given user is on Expedia Home page
    When user selects the round trip tab under the flight section

#  Imprative
  @regression
  Scenario: Verify the user gets an error message when searching for past date flights
    And user select Columbus, OH airport for the city columbus in the departure field
    And user select Cleveland, OH airport for the city cleveland in the arrival field
#    And user enter past date in the departure calender
#    And user enter past date in the arrival calender
    And user searches for the past date flights
    And user searches for the available flights
    Then Verify the Departing date is in the past. Please enter a valid departing date. message is displayed

#  Declarative
  @smoke @expedia_search
  Scenario: Verify the user gets an error message when searching for the past date flight
    When user searches for a past flights
    Then verify the user is warned with a message

  @defect
  Scenario Outline: Verify the user gets the available flights for the airport searched
    And user select <dep_airport> airport for the city <dep_city> in the departure field
    And user select <arr_airport> airport for the city <arr_city> in the arrival field
#    And user enter <date> date in the departure calender
#    And user enter <date> date in the arrival calender
    And user searches for the future date flights
    And user searches for the available flights
    Then verify user gets the correct details for the <arr_city>

    Examples:
      | dep_city | arr_city  | dep_airport  | arr_airport   | # future_past
      | Columbus | Cleveland | Columbus, OH | Cleveland, OH | # future
      | Chicago  | Las Vegas | Chicago, IL  | Las Vegas, NV | # future


#  Inline Table
  @expedia_search_0034
  Scenario: Verify the user gets an error messages when searching for flights with no data
    And user searches for the past date flights
    And user searches for the available flights
    Then verify the following error_message is displayed
      | error_message                                                       | date |
      | Departing date is in the past. Please enter a valid departing date. | 1234 |
      | Returning date is in the past. Please enter a valid returning date. | 123  |
      | Please complete the highlighted origin field below.                 | 12   |
      | Please complete the highlighted destination field below.            | 1    |

  @expedia_search
  Scenario: Verify the flight search results are sorted by price
    And user select Columbus, OH airport for the city columbus in the departure field
    And user select Cleveland, OH airport for the city cleveland in the arrival field
    And user searches for the future date flights
    And user searches for the available flights
    Then verify the flight search results are sorted by the price

  @smoke
  Scenario: testing the yml functionality
    Then verify if the yml functionality works

  @manual
  Scenario: verify the look and feel of the expedia home page
    Then verify the look and feel of the expedia page is as expected

  @wip
  Scenario: Verify the user gets an error message when searching for the past date flight
    When user searches for a past flights and cars
    Then verify the user is warned with a messages


