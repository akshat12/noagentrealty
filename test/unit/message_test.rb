require 'test_helper'

# Unit Tests for message Model

class MessageTest < ActiveSupport::TestCase

# --------------- Create message ----------------------

	 # Test Case M00: Create message(name only)

	 # Precondition: message doesn't exist
	
	 # Input: message name
	 # Expected Output: message is not valid
	 # Actual Output: message is not valid
   test "should not valid message with only name" do
        message = Message.new()
        message.name = "HI"
   	assert !message.valid?, "valid message with only name"
   end

   # Test Case M01: Create message (Email Only)

   # Precondition: message doesn't exist
   # Input: New Message with email attribute only
   # Expected Output: message is not valid (message.valid? = false)
   # Actual Output: message is not valid
   test "should not valid message with email only" do
        message = Message.new()
        message.email = "hi@ya.bro"
   	assert !message.valid?, "valid message with email only"
   end

   # Test Case M02: New message (content Only)

   # Precondition: Create a new message with the content attribute only.
   # Input: New message with content attribute only
   # Expected Output: message is not valid (message.valid = false)
   # Actual Output: message is not valid
   test "should not valid message with content only" do
   	message = Message.new()
        message.content = "i'm content"
   	assert !message.valid?, "valid message with content only"
   end

   # Test Case M03: New message (name and email only)

   # Precondition: Create a new message with name and email  attributes.
   # Input: New message with message type name and email attributes only
   # Expected Output: message is not valid (message.valid = false)
   # Actual Output: message is not valid
   test "should not valid message with name & email only" do
        message = Message.new()
        message.name = "NAME"
        message.email = "hi@ya.com"
   	assert !message.valid?, "valid message with name and email only"
   end

   # Test Case M04: New message (name and content only)

   # Precondition: Create a new message with name and content only.
   # Input: New message with name and content attributes only
   # Expected Output: message is not valid (message.valid = false)
   # Actual Output: message is not valid
   test "should not valid message with name and content only" do
   	message = Message.new()
        message.name = "Name"
        message.content = "ConTenT"
   	assert !message.valid?, "valid message with name and content only"
   end 

   # Test Case M05: New message (email and content Only)

   # Precondition: Create a new message with the email and content attribute only.
   # Input: New message with email and content attribute only
   # Expected Output: message is not valid (message.valid = false)
   # Actual Output: message is not valid
   test "should not valid message with email and content only" do
        message = Message.new()
        message.email = "f@a.c"
        message.content = "HELLO!"
   	assert !message.valid?, "valid message with email and content only"
   end

   # Test Case M06: New message (email,content & name)

   # Precondition: Create a new message with email, content and name attributes.
   # Input: New message with all attributes
   # Expected Output: message is valid (message.valid = false)
   # Actual Output: message is valid
   test "should valid message with all attributes" do
        message = Message.new()
        message.email = "hi@ya.bro"
        message.name = "Nam"
        message.content = "Hi folks"
   	assert message.valid?, "Message was not valid with all attributes"
   end

   
   
	


  
end
