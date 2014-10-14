require "selenium-webdriver"
require "test/unit"

class LogoutTest < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "localhost:3000"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_logout
    # Test: Login Test
    # Tests to see that login is successful with a user that exists in the data base

# Open the page
@driver.get(@base_url + "/")
# Test: Click on the sign out linkt: 
@driver.find_element(:link, "Sign Out").click
# Assertion: Check to see that the user is on the home page
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign In[\s\S]*$/, @driver.find_element(:link, "Sign In").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign Up[\s\S]*$/, @driver.find_element(:link, "Sign Up").text
@driver.navigate.refresh
  end
  
  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue Test::Unit::AssertionFailedError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = @driver.switch_to().alert()
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert.text
  ensure
    @accept_next_alert = true
  end
end
