# require 'watir-webdriver'
#
# @browser = Watir::Browser.new :chrome
# @browser.goto 'www.expedia.com'
# @browser.driver.manage.window.maximize
#
# # visit ExpediaHotelPage
# @browser.link(:id => 'tab-hotel-tab').click
# @browser.text_field(:id => 'hotel-destination').set 'Columbus'
# @browser.text_field(:id => 'hotel-destination').send_keys :end
# # sleep 10
# @browser.ul(:class => 'results').when_present.lis.each do |airport|
#   # p airport.text
#   if airport.text.include? 'Columbus, OH'
#     airport.click
#     break
#     sleep 2
#   end
# @browser.text_field(:id=>'hotel-checkin').set '01/25/2017'
# @browser.text_field(:id=>'hotel-checkout').set '01/29/2017'
# @browser.button(:id=>'search-button').click
# sleep 10
#
# @browser.div(:class=>'container')
# end
#
#
# # select_hotel_tab_element.click
# #
# #
# # going_to_airport_element.set 'columbus'
# # going_to_airport_element.send_keys :end
# # hotel_search_result_element.when_present.list_items each do |airport|
# #   p airport.text
# #   if airport.text include? 'columbus'
# #     airport.text.click
# #   end

x = ["$1,095", "$1,095", "$1,095", "$1,101", "$1,101", "$1,105", "$1,125", "$1,245"]

x = "$1,095"
p x.gsub('$','').gsub(',','').to_i