require "selenium-webdriver"
require "test/unit"

class LoginTest < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :ie
    @base_url = "http://localhost:3000/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_login
    # Test: Login Test
    # Description: Tests to see that login is successful with a user that exists in the data base

# Variables Storage:
username = "randomtest@mailinator.com"
password = "test123"
# End variable storage
# Open the page
@driver.get(@base_url + "/")
# Test: Login using the username and password stored above
@driver.find_element(:link, "Sign In").click
@driver.find_element(:id, "session_email").clear
@driver.find_element(:id, "session_email").send_keys username
@driver.find_element(:id, "session_password").clear
@driver.find_element(:id, "session_password").send_keys password
@driver.find_element(:name, "commit").click

# Assertion: Check to see that user signs in successfully to the account
# Warning: assertTextNotPresent may require manual changes
assert_no_match /^[\s\S]*Sign In[\s\S]*$/, @driver.find_element(:css, "BODY").text
@driver.navigate.refresh
# Warning: assertTextNotPresent may require manual changes
assert_no_match /^[\s\S]*Sign Up[\s\S]*$/, @driver.find_element(:css, "BODY").text
@driver.navigate.refresh
@driver.find_element(:link, "test").click
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Profile[\s\S]*$/, @driver.find_element(:link, "Profile").text
@driver.navigate.refresh
@driver.find_element(:link, "test").click
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign Out[\s\S]*$/, @driver.find_element(:link, "Sign Out").text
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
