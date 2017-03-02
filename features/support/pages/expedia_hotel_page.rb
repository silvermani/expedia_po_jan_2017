# class ExpediaHotelPage
#   include PageObject
#
#   page_url 'www.expedia.com'
#
#   link(:select_hotel_tab, :id => 'tab-hotel-tab')
#   text_field(:hotel_destination_textBox, :id => 'hotel-destination')
#   ul(:hotel_search_result_from_list, :class => 'results')
#   text_field(:check_in_date, :id => 'hotel-checkin')
#   text_field(:check_out_date, :id => 'hotel-checkout')
#   button(:search_button, :id => 'search-button')
#   links(:error_message_link, :class => 'dateBeforeCurrentDateMessage')
#
#
#   def set_hotel_destination hotel_city, select_city
#     self.hotel_destination_textBox = hotel_city
#     # self.hotel_destination_textBox_element = 'columbus'
#     hotel_destination_textBox_element.send_keys :end
#     search_destination_from_list select_city
#   end
#
#   def search_destination_from_list select_city
#     #-- hotel_search_result_from_list_element.when_present.list_items.each do |airport|
#     hotel_search_result_from_list_element.when_present.list_item_elements.each do |airport|
#       p airport.text
#       #-- if airport.text include? select_city
#       if airport.text.include? select_city
#         #-- airport.text.click
#         airport.click
#         break
#       end
#     end
#   end
#
#   def set_checkin_date checkIn_date
#     self.check_in_date = checkIn_date
#   end
#
#   def set_checkout_date checkOut_date
#     self.check_out_date = checkOut_date
#   end
#
#   def click_search_button
#     search_button_element.click
#   end
#
#   def verify_error_message error_msg
#     error_message_link_elements.each do |errors|
#       if errors.text.include? error_msg
#         p 'error message match'
#         break
#       else
#         fail 'error message did not match'
#       end
#     end
#   end
# end