module Utilities

  def navigate_to url
    @browser.goto url
  end

  def convert_time (no_of_days)
    x = Time.new
    y = x + 60*60*24*no_of_days
    y.strftime("%m/%d/%y")
  end

  def maximize_window
    @browser.driver.manage.window.maximize
  end
end

