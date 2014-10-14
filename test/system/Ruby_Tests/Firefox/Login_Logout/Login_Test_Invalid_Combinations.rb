require "selenium-webdriver"
require "test/unit"

class LoginTestInvalidCombinations < Test::Unit::TestCase

  def setup
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:3000"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  def teardown
    @driver.quit
    assert_equal [], @verification_errors
  end
  
  def test_login_test_invalid_combinations
    # Test: Login Invalid Combination Test
    # Description: Attempts to enter in invalid combinations of user names and passwords to see if there is a match in the database

# Open the page
@driver.get(@base_url + "/")
# Variable Storage
invalidEmailPasswordErrorMessage = "Invalid email/password combination"
usernameInDB = "randomtest@mailinator.com"
passwordInDB = "test123"
# End variable storage
# Test 1: Log in without entering in a user name and password
@driver.find_element(:link, "Sign In").click
@driver.find_element(:id, "session_email").clear
@driver.find_element(:id, "session_email").send_keys ""
@driver.find_element(:id, "session_password").clear
@driver.find_element(:id, "session_password").send_keys ""
@driver.find_element(:name, "commit").click

# Assertion: User should not be logged in and an error message should appear.
assert_equal invalidEmailPasswordErrorMessage, @driver.find_element(:xpath, "//div[@class =\"alert alert-error\"]").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign In[\s\S]*$/, @driver.find_element(:link, "Sign In").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign Up[\s\S]*$/, @driver.find_element(:link, "Sign Up").text
@driver.navigate.refresh

# Test 2: Enter in an email without the host name name and a password with less than 6 characters long and attempt to log in
@driver.find_element(:id, "session_email").clear
@driver.find_element(:id, "session_email").send_keys "test"
@driver.find_element(:id, "session_password").clear
@driver.find_element(:id, "session_password").send_keys "test"
@driver.find_element(:name, "commit").click

# Assertion: User should not be logged in and an error message should appear.
assert_equal invalidEmailPasswordErrorMessage, @driver.find_element(:xpath, "//div[@class =\"alert alert-error\"]").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign In[\s\S]*$/, @driver.find_element(:link, "Sign In").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign Up[\s\S]*$/, @driver.find_element(:link, "Sign Up").text
@driver.navigate.refresh

# Test 3: Enter in a valid email that doesn't exist in the database and an invalid password of 4 characters long
@driver.find_element(:id, "session_email").clear
@driver.find_element(:id, "session_email").send_keys "Test@mailinator.com"
@driver.find_element(:id, "session_password").clear
@driver.find_element(:id, "session_password").send_keys "test"
@driver.find_element(:name, "commit").click

# Assertion: User should not be logged in and an error message should appear.
assert_equal invalidEmailPasswordErrorMessage, @driver.find_element(:xpath, "//div[@class =\"alert alert-error\"]").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign In[\s\S]*$/, @driver.find_element(:link, "Sign In").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign Up[\s\S]*$/, @driver.find_element(:link, "Sign Up").text
@driver.navigate.refresh

# Test 4: Enter in an email address that exists in the database and a password that is not in the database
@driver.find_element(:id, "session_email").clear
@driver.find_element(:id, "session_email").send_keys usernameInDB
@driver.find_element(:id, "session_password").clear
@driver.find_element(:id, "session_password").send_keys "tester1"
@driver.find_element(:name, "commit").click

# Assertion: User should not be logged in and an error message should appear.
assert_equal invalidEmailPasswordErrorMessage, @driver.find_element(:xpath, "//div[@class =\"alert alert-error\"]").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign In[\s\S]*$/, @driver.find_element(:link, "Sign In").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign Up[\s\S]*$/, @driver.find_element(:link, "Sign Up").text
@driver.navigate.refresh

# Test 5: Enter in a invalid email that doesn't exist in the database and an valid password that is in the data base
@driver.find_element(:id, "session_email").clear
@driver.find_element(:id, "session_email").send_keys "Test@mailinator.com"
@driver.find_element(:id, "session_password").clear
@driver.find_element(:id, "session_password").send_keys passwordInDB
@driver.find_element(:name, "commit").click

# Assertion: User should not be logged in and an error message should appear.
assert_equal invalidEmailPasswordErrorMessage, @driver.find_element(:xpath, "//div[@class =\"alert alert-error\"]").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign In[\s\S]*$/, @driver.find_element(:link, "Sign In").text
@driver.navigate.refresh
# Warning: assertTextPresent may require manual changes
assert_match /^[\s\S]*Sign Up[\s\S]*$/, @driver.find_element(:link, "Sign Up").text
@driver.navigate.refresh

# Test 6: Attempt to log in using the user's profile name as the email address and the same password
@driver.find_element(:id, "session_email").clear
@driver.find_element(:id, "session_email").send_keys "Test"
@driver.find_element(:id, "session_password").clear
@driver.find_element(:id, "session_password").send_keys passwordInDB
@driver.find_element(:name, "commit").click

# Assertion: User should not be logged in and an error message should appear.
assert_equal invalidEmailPasswordErrorMessage, @driver.find_element(:xpath, "//div[@class =\"alert alert-error\"]").text
@driver.navigate.refresh
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
