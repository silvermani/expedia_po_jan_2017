Given(/^user is on Expedia Home page$/) do
  visit ExpediaHomePage
end

When(/^user selects the round trip tab under the flight section$/) do
  on(ExpediaHomePage).select_flights_tab_element.click
  on(ExpediaHomePage).select_roundtrip_tab_element.click
end


And(/^user select (.*) airport for the city (.*) in the (departure|arrival) field$/) do |airport_name, city_name, dep_arr|
  if dep_arr == 'departure'
    on(ExpediaHomePage).set_departure_airport city_name, airport_name
  else
    on(ExpediaHomePage).set_arrival_airport city_name, airport_name
  end
end
# And(/^user select (.*) airport for the city (.*) in the arrival field$/) do |airport_name, city_name|
#   on(ExpediaHomePage).set_arrival_airport city_name, airport_name
# end

# And(/^user enter (.*) date in the (.*) calender$/) do |future_or_past, dep_arr|
#   if future_or_past == 'past'
#     on(ExpediaHomePage).set_departing_date -2
#     on(ExpediaHomePage).set_returning_date 10
#   else
#     on(ExpediaHomePage).set_departing_date 2
#     on(ExpediaHomePage).set_returning_date 10
#   end
# end
# And(/^user enter (.*) date in the (.*) calender$/) do |future_or_past|
#   on(ExpediaHomePage).set_returning_date 10
# end

And(/^user searches for the available flights$/) do
  on(ExpediaHomePage).click_search_button_element.click
end

Then(/^Verify the (.*) message is displayed$/) do |error_message|
  # on(ExpediaHomePage).verify_error_messages error_message
  all_error_message = on(ExpediaHomePage).get_error_messages
  fail "#{all_error_message} does not include #{message['error_message']}" unless all_error_message.include? error_message
end

And(/^user searches for the (past|future) date flights$/) do |future_or_past|
  if future_or_past == 'past'
    on(ExpediaHomePage).set_departing_date -2
    on(ExpediaHomePage).set_returning_date -10
  else
    on(ExpediaHomePage).set_departing_date 2
    on(ExpediaHomePage).set_returning_date 10
  end
end

Then(/^verify user gets the correct details for the (.*)$/) do |arr_city|
  on(ExpediaSearchResultsPage).verify_search_results_are_correct? arr_city
end

# Then(/^verify the following error_message is displayed$/) do |table|
#   # table is a table.hashes.keys # => [:Please complete the highlighted origin field below.]
#   table.hashes.each do |message|
#     p message['error_message']
#   end
# end

# Then(/^verify the following error_message is displayed$/) do |table|
#   # table is a table.hashes.keys # => [:error_message]
#   table.hashes.each do |message|
#     p message['error_message']
#   end
# end

Then(/^verify the following error_message is displayed$/) do |table|
  # table is a table.hashes.keys # => [:error_message]
  table.hashes.each do |message|
    p message['error_message']
    p message['date']
    all_error_message = on(ExpediaHomePage).get_error_messages
    fail "#{all_error_message} does not include #{message['error_message']}" unless all_error_message.include? message['error_message']
  end
end

# When(/^user searches for a past date flights for (.*) with city (.*) in the departure field$/) do |airport_name,city_name|
#   step "user select #{airport_name} airport for the city #{city_name} in the departure field"
# end

# When(/^user searches for a past flights$/) do
#   step 'user select Columbus, OH airport for the city columbus in the departure field'
#   step 'user select Cleveland, OH airport for the city cleveland in the arrival field'
#   step 'user searches for the past date flights'
#   step 'user searches for the available flights'
# end

# Then(/^verify the user is warned with a messeage$/) do
#   # on(ExpediaHomePage).verify_error_messages error_message
#   # fail "#{all_error_message} does not include #{message['error_message']}" unless all_error_message.include? error_message
#   all_error_message = on(ExpediaHomePage).get_error_messages
#   expect(all_error_message).should include 'Departing date is in the past. Please enter a valid departing date.'
# end


When(/^user searches for a past flights$/) do
  # step 'user is on Expedia Home page'
  # step 'user selects the round trip tab under the flight section'
  # step 'user select Columbus, OH airport for the city columbus in the departure field'
  # step 'user select Cleveland, OH airport for the city cleveland in the arrival field'
  # step 'user searches for the past date flights'
  # step 'user searches for the available flights'


  # Steps %Q{
  #   And user select Columbus, OH airport for the city columbus in the departure field
  #   And user select Cleveland, OH airport for the city cleveland in the arrival field
  #   And user searches for the past date flights
  #   And user searches for the available flights
  #         }

  on(ExpediaHomePage).set_departure_airport 'columbus', 'Columbus, OH'
  on(ExpediaHomePage).set_arrival_airport 'cleveland', 'Cleveland, OH'
  on(ExpediaHomePage).set_departing_date -2
  on(ExpediaHomePage).set_returning_date 10
  on(ExpediaHomePage).click_search_button_element.click


  # on(ExpediaHomePage) do |page|
  #   page.set_departure_airport 'columbus', 'Columbus, OH'
  #   page.set_arrival_airport 'cleveland', 'Cleveland, OH'
  #   page.set_departing_date -2
  #   page.set_returning_date -10
  #   page.click_search_button_element.click
  # end

  # on(ExpediaHomePage).search_for_flights -2

end

When(/^user searches for a past flights for (.*) with city (.*)$/) do |airport_name, city_name|
  step "user select #{airport_name} airport for the city #{city_name} in the departure field"
end

Then(/^verify the user is warned with a message$/) do
  all_error_message = on(ExpediaHomePage).get_error_messages
  expect(all_error_message).should equal? 'Departing date is in the past. Please enter a valid departing date.'
end

Then(/^verify the flight search results are sorted by the price$/) do
  actual_prices = on(ExpediaSearchResultsPage).get_flight_prices
  expect(actual_prices).should eq actual_prices.sort
end

Then(/^verify if the yml functionality works$/) do
  on(ExpediaHomePage).load_data_using_yml
end