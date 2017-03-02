# Given(/^user is on expedia home page\.$/) do
#   visit ExpediaHotelPage
# end
#
# When(/^user selects hotels tab on home page\.$/) do
#   on(ExpediaHotelPage).select_hotel_tab_element.click
# end
#
#
# And(/^user selects (.*) destination for the hotel in city (.*) in the Going to field$/) do |select_city, hotel_city|
#   on(ExpediaHotelPage).set_hotel_destination hotel_city, select_city
# end
#
# And(/^user enters (.*) in the check\-in field$/) do |checkIn_date|
#   on(ExpediaHotelPage).set_checkin_date checkIn_date
# end
#
# And(/^user enters (.*) in the check\-out field$/) do |checkOut_date|
#   on(ExpediaHotelPage).set_checkout_date checkOut_date
# end
#
# And(/^user searches for the available hotel results by clicking search button\.$/) do
#   on(ExpediaHotelPage).click_search_button
# end
#
# Then(/^verify the (.*) messege is displayed$/) do |error_msg|
#   on(ExpediaHotelPage).verify_error_message error_msg
# end