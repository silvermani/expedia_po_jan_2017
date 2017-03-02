require_relative '../modules/utilities'

class ExpediaHomePage
  include PageObject
  include Utilities

  page_url 'www.expedia.com'
  button(:select_flights_tab, :id => 'tab-flight-tab-hp')
  label(:select_roundtrip_tab, :id => 'flight-type-roundtrip-label-hp-flight')
  text_field(:set_departure_airport, :id => 'flight-origin-hp-flight')
  text_field(:set_arrival_airport, :id => 'flight-destination-hp-flight')
  ul(:flight_results, :class => 'results')
  text_field(:set_departure_date, :id => 'flight-departing-hp-flight')
  text_field(:set_returning_date, :id => 'flight-returning-hp-flight')
  button(:click_search_button, :class => 'btn-primary btn-action gcw-submit')
  # div(:error_message, :class => 'alert-message')
  links(:error_messages, :class => 'error-link')

  def set_departure_airport city_name, airport_name
    # @browser.text_field(:id => 'flight-origin').set city_name
    # set_departure_airport_element.set city_name
    self.set_departure_airport = city_name
    # @browser.text_field(:id => 'flight-origin').send_keys :end
    set_departure_airport_element.send_keys :end
    select_correct_airport airport_name
  end


  sleep 10
  # @browser.ul(:class => 'results').when_present.lis.each do |airport|
  #   # p airport.text
  #   airport.text.include? 'Columbus, OH'
  #   airport.click
  #   break
  # end

  def select_correct_airport airport_name
    # @browser.ul(:class => 'results').when_present.lis.each do |airport|
    # p airport.text
    # airport.text.include? airport_name
    # airport.click
    # break
    # p flight_results_element.methods.sort
    flight_results_element.when_present.list_item_elements.each do |airport|
      # p airport.text
      airport.text.include? airport_name
      airport.click
      break
    end
  end


  sleep 5

  def set_arrival_airport city_name, airport_name
    # @browser.text_field(:id => 'flight-destination').set city_name
    # set_arrival_airport_element.set city_name
    self.set_arrival_airport = city_name
    # @browser.text_field(:id => 'flight-destination').send_keys :end
    set_arrival_airport_element.send_keys :end
    select_correct_airport airport_name
  end

  sleep 2
  # @browser.ul(:class => 'results').when_present.lis.each do |airport|
  #   # p airport.text
  #   airport.text.include? 'Cleveland, OH'
  #   airport.click
  #   break
  # end

  def set_departing_date no_of_days
    date = convert_time no_of_days
    # @browser.text_field(:id => 'flight-departing').set date
    self.set_departure_date = date
  end

  def set_returning_date no_of_days
    date= convert_time no_of_days
    # @browser.text_field(:id => 'flight-returning').set date
    self.set_returning_date = date
  end

  # def clickon_search_button
  #   @browser.button(:id => 'search-button').click
  # end

  sleep 10


  # def verify_error_message message
  #   # error_message = @browser.link(:class => 'dateBeforeCurrentDateMessage').text
  #   error_message =  error_message_element.text
  #   p error_message
  #   if error_message.include? message
  #       if error_message.include? 'Departing date is in the past. Please enter a valid departing date.'
  #     p 'This test is passed'
  #   else
  #     p 'This test is failed'
  #   end
  # end
  # end

  # def verify_error_messages error
  #   error_messages_elements.each do |message|
  #     p message.text
  #     if message.text.include? error
  #       break
  #     else
  #       fail "#{error} is not same as #{message.text}."
  #     end
  #   end
  # end

  def get_error_messages
    error_messages_elements.map do |error_message|
      error_message.text
    end
  end


  def search_for_flights days
    # @data = load_data_using_yml
    set_departure_airport 'columbus', 'Columbus, OH'
    # set_departure_airport @data['QA']['city_name'], @data['QA']['airport_name']
    set_arrival_airport 'cleveland', 'Cleveland, OH'
    # set_arrival_airport @data['QA'][city_name], @data['QA']['airport_name']
    set_departing_date days
    set_returning_date days
    click_search_button_element.click
  end

  def load_data_using_yml

    @file = YAML.load_file('C:\Users\Harsh\Desktop\Jan\expedia_po_jan_2017\features\support\test_data.yml')
    # YAML.load_file('../support/test_data.yml')
    # p @file.fetch('request')
    p @file['company']
    # p @file['QA']['city_name']


    File.open('C:\Users\Harsh\Desktop\Jan\expedia_po_jan_2017\features\support\test_data.yml', 'w') {|f| f.write(@file.to_yaml)}

    @file['company'] = 'company_name'

    p 'after update'
    p @file.fetch('company')

  end


  # def load_data_using_yml
  #
  #   @file = YAML.load_file('C:\Users\Harsh\Desktop\Jan\expedia_po_jan_2017\features\support\test_data.yml')
  #
  # end






end
