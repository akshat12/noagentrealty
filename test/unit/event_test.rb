# /test/unit/event_test.rb

require 'test_helper'

class EventTest < ActiveSupport::TestCase
	# test "the truth" do
  	#   assert true
  	# end

# -------------- Create Event ------------------

	# Test Case E00: Creating an event with only name

	# Precondition: Event doesn't already exist 
	# Input: name
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with name only" do
		event = Event.new(:name => "Deconstruction Sale")
		event.location = Location.new
		assert !event.save, "Saved the event with name only"
	end

	# Test Case E01: Creating an event with only description

	# Precondition: Event doesn't already exist 
	# Input: description
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with description only" do
		event = Event.new(:description => "Test Description")
		event.location = Location.new
		assert !event.save, "Saved the event with description only"
	end


	# Test Case E02: Creating an event with only event date

	# Precondition: Event doesn't already exist 
	# Input: event_date
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with event date only" do
		event = Event.new
		event.location = Location.new
		event.event_date = Date.today + 30
		assert !event.save, "Saved the event with event date only"
	end


	# Test Case E03: Creating an event with only start time

	# Precondition: Event doesn't already exist 
	# Input: start_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with start time only" do
		event = Event.new(:start_time => "22:00")
		event.location = Location.new
		assert !event.save, "Saved the event with start time only"
	end


	# Test Case E04: Creating an event with only end time

	# Precondition: Event doesn't already exist 
	# Input: end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with end time only" do
		event = Event.new(:end_time => "23:00")
		event.location = Location.new
		assert !event.save, "Saved the event with end time only"
	end


	# Test Case E05: Creating an event with only image

	# Precondition: Event doesn't already exist 
	# Input: image
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with image only" do
		event = Event.new
		event.location = Location.new
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert !event.save, "Saved the event with image only"
	end


	# Test Case E06: Creating an event with only user id

	# Precondition: Event doesn't already exist 
	# Input: user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with user id only" do
		event = Event.new
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event with user id only"
	end


	# Test Case E07: Creating an event with only name and description

	# Precondition: Event doesn't already exist 
	# Input: name, description
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with name and description only" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.location = Location.new
		assert !event.save, "Saved the event with name and description only"
	end


	# Test Case E08: Creating an event with only name and event date

	# Precondition: Event doesn't already exist 
	# Input: name, event_date
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with name and event date only" do
		event = Event.new(:name => "Event Name")
		event.event_date = Date.today + 30
		event.location = Location.new
		assert !event.save, "Saved the event with name and event date only"
	end


	# Test Case E09: Creating an event with only name and start time

	# Precondition: Event doesn't already exist 
	# Input: name, start_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with name and start time only" do
		event = Event.new(:name => "Event Name")
		event.start_time = "13:00"
		event.location = Location.new
		assert !event.save, "Saved the event with name and start time only"
	end

	# Test Case E10: Creating an event with only name and end time

	# Precondition: Event doesn't already exist 
	# Input: name, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with name and end time only" do
		event = Event.new(:name => "Event Name")
		event.end_time = "13:00"
		event.location = Location.new
		assert !event.save, "Saved the event with name and end time only"
	end

	# Test Case E11: Creating an event with only name and image

	# Precondition: Event doesn't already exist 
	# Input: name, image 
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with name and image only" do
		event = Event.new(:name => "Event Name")
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		event.location = Location.new
		assert !event.save, "Saved the event with name and image only"
	end

	# Test Case E12: Creating an event with only name and user_id

	# Precondition: Event doesn't already exist 
	# Input: name, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with name and user id only" do
		event = Event.new(:name => "Event Name")
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event with name and user id only"
	end

	# Test Case E13: Creating an event with only description and event date

	# Precondition: Event doesn't already exist 
	# Input: description, event_date
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with description and event date only" do
		event = Event.new(:description => "Description")
		event.event_date = Date.today + 30
		event.location = Location.new
		assert !event.save, "Saved the event with description and event date only"
	end

	# Test Case E14: Creating an event with only description and start time

	# Precondition: Event doesn't already exist 
	# Input: description, start_time 
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with description and start time only" do
		event = Event.new(:description => "Description")
		event.start_time = "13:00"
		event.location = Location.new
		assert !event.save, "Saved the event with description and start time only"
	end

	# Test Case E15: Creating an event with only description and end time

	# Precondition: Event doesn't already exist 
	# Input: description, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with description and end time only" do
		event = Event.new(:description => "Description")
		event.end_time = "14:00"
		event.location = Location.new
		assert !event.save, "Saved the event with description and end time only"
	end

	# Test Case E16: Creating an event with only description and image

	# Precondition: Event doesn't already exist 
	# Input: description, image
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with description and image only" do
		event = Event.new(:description => "Description")
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		event.location = Location.new
		assert !event.save, "Saved the event with description and image only"
	end

	# Test Case E17: Creating an event with only description and user id

	# Precondition: Event doesn't already exist 
	# Input: description, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with description and user id only" do
		event = Event.new(:description => "Description")
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event with description and user id only"
	end

	# Test Case E18: Creating an event with only event date and start time

	# Precondition: Event doesn't already exist 
	# Input: event_date, start_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with event date and start time only" do
		event = Event.new
		event.event_date = Date.today + 30
		event.start_time = "12:00"
		event.location = Location.new
		assert !event.save, "Saved the event with event date and start time only"
	end

	# Test Case E19: Creating an event with only event date and end time

	# Precondition: Event doesn't already exist 
	# Input: event_date, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with event date and end time only" do
		event = Event.new
		event.event_date = Date.today + 30
		event.end_time = "14:00"
		event.location = Location.new
		assert !event.save, "Saved the event with event date and end time only"
	end

	# Test Case E20: Creating an event with only event date and image

	# Precondition: Event doesn't already exist 
	# Input: event_date, image
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with event date and image" do
		event = Event.new
		event.event_date = Date.today + 30
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		event.location = Location.new
		assert !event.save, "Saved the event with event date and image only"
	end

	# Test Case E21: Creating an event with only event date and user id

	# Precondition: Event doesn't already exist 
	# Input: event_date, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with event date and user id only" do
		event = Event.new
		event.event_date = Date.today + 30
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event with event date and user id only"
	end

	# Test Case E22: Creating an event with only start time and end time

	# Precondition: Event doesn't already exist 
	# Input: start_time, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with start time and end time only" do
		event = Event.new
		event.start_time = "12:00"
		event.end_time = "14:00"
		event.location = Location.new
		assert !event.save, "Saved the event with start time and end time only"
	end

	# Test Case E23: Creating an event with only start time and image

	# Precondition: Event doesn't already exist 
	# Input: start_time, image 
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with start time and image only" do
		event = Event.new
		event.start_time = "12:00"
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		event.location = Location.new
		assert !event.save, "Saved the event with start time and image only"
	end

	# Test Case E24: Creating an event with only start time and user id

	# Precondition: Event doesn't already exist 
	# Input: start_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with start time and user id only" do
		event = Event.new
		event.start_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event with start time and user id only"
	end

	# Test Case E25: Creating an event with only end time and image

	# Precondition: Event doesn't already exist 
	# Input: end_time, image
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with end time and image only" do
		event = Event.new
		event.end_time = "14:00"
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		event.location = Location.new
		assert !event.save, "Saved the event with end time and image only"
	end

	# Test Case E26: Creating an event with only end time and user id

	# Precondition: Event doesn't already exist 
	# Input: end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with end time and user id only" do
		event = Event.new
		event.end_time = "14:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event with end time and user id only"
	end

	# Test Case E27: Creating an event with only image and user id

	# Precondition: Event doesn't already exist 
	# Input: image, user_id 
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with image and user id only" do
		event = Event.new
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event with image and user id only"
	end

	# Test Case E28: Creating an event with all required fields

	# Precondition: Event doesn't already exist 
	# Input: name, description, event_date, start_time, end_time, user_id
	# Expected Output: Event is created
	# Actual Output: Event is created

	test "create event with all required fields" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.event_date = Date.today + 30
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert event.save, "Did not save the event with all required fields"
	end

	# Test Case E29: Creating an event with all required fields except for user id

	# Precondition: Event doesn't already exist 
	# Input: name, description, event_date, start_time, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for user id" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.event_date = Date.today + 30
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.location = Location.new
		assert !event.save, "Saved the event without user id"
	end

	# Test Case E30: Creating an event with all required fields except for name

	# Precondition: Event doesn't already exist 
	# Input: description, event_date, start_time, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for name" do
		event = Event.new(:description => "Description")
		event.event_date = Date.today + 30
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without name"
	end

	# Test Case E31: Creating an event with all required fields except for description

	# Precondition: Event doesn't already exist 
	# Input: name, event_date, start_time, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for description" do
		event = Event.new(:name => "Event Name")
		event.event_date = Date.today + 30
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without description"
	end

	# Test Case E32: Creating an event with all required fields except for event date

	# Precondition: Event doesn't already exist 
	# Input: name, description, start_time, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except event date" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without event date"
	end

	# Test Case E33: Creating an event with all required fields except for start time

	# Precondition: Event doesn't already exist 
	# Input: name, description, event_date, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for start time" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.event_date = Date.today + 30
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without start time"
	end

	# Test Case E34: Creating an event with all required fields except for user id and name

	# Precondition: Event doesn't already exist 
	# Input: description, event_date, start_time, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for user id and name" do
		event = Event.new(:description => "Description")
		event.event_date = Date.today + 30
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.location = Location.new
		assert !event.save, "Saved the event without user id and name"
	end

	# Test Case E35: Creating an event with all required fields except for user id and description

	# Precondition: Event doesn't already exist 
	# Input: name, event_date, start_time, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for user id and description" do
		event = Event.new(:name => "Event Name")
		event.event_date = Date.today + 30
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.location = Location.new
		assert !event.save, "Saved the event without user id and description"
	end

	# Test Case E36: Creating an event with all required fields except for user id and event date

	# Precondition: Event doesn't already exist 
	# Input: name, description, start_time, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for user id and event date" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.location = Location.new
		assert !event.save, "Saved the event without user id and event date"
	end

	# Test Case E37: Creating an event with all required fields except for user id and start time

	# Precondition: Event doesn't already exist 
	# Input: name, description, event_date, end_time
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for user id and start time" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.event_date = Date.today + 30
		event.end_time = "12:00"
		event.location = Location.new
		assert !event.save, "Saved the event without user id and start time"
	end

	# Test Case E38: Creating an event with all required fields except for name and description

	# Precondition: Event doesn't already exist 
	# Input: event_date, start_time, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for name and description" do
		event = Event.new
		event.event_date = Date.today + 30
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without name and description"
	end

	# Test Case E39: Creating an event with all required fields except for name and event date

	# Precondition: Event doesn't already exist 
	# Input: description, start_time, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for name and event date" do
		event = Event.new(:description => "Description")
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without name and event date"
	end

	# Test Case E40: Creating an event with all required fields except for name and start time

	# Precondition: Event doesn't already exist 
	# Input: description, event_date, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for name and start time" do
		event = Event.new(:description => "Description")
		event.event_date = Date.today + 30
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without name and start time"
	end

	# Test Case E41: Creating an event with all required fields except for description and event date

	# Precondition: Event doesn't already exist 
	# Input: name, start_time, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for description and event date" do
		event = Event.new(:name => "Event Name")
		event.start_time = "11:00"
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without description and event date"
	end

	# Test Case E42: Creating an event with all required fields except for description and start time

	# Precondition: Event doesn't already exist 
	# Input: name, event_date, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for description and start time" do
		event = Event.new(:name => "Event Name")
		event.event_date = Date.today + 30
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event withotu description and start time"
	end

	# Test Case E43: Creating an event with all required fields except for event date and start time

	# Precondition: Event doesn't already exist 
	# Input: name, description, end_time, user_id
	# Expected Output: Event is not created
	# Actual Output: Event is not created

	test "create event with all required fields except for event date and start time" do
		event = Event.new(:name => "Event Name", :description => "Description")
		event.end_time = "12:00"
		event.user_id = User.first.id
		event.location = Location.new
		assert !event.save, "Saved the event without event date and start time"
	end

#------------- End Create Event --------------------

# -------------- Modify Event ------------------

	# Test Case E48: Modify event's user id
	# Input: user_id
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's user id" do
		event = Event.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { event.update_attributes(:user_id => User.first.id) }
	end

	# Test Case E49: Modify event's name
	# Input: name
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's name" do
		event = Event.first
		assert event.update_attributes(:name => "Name")
		assert_equal "Name", event.name
	end

	# Test Case E50: Modify event's description
	# Input: description
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's description" do
		event = Event.first
		assert event.update_attributes(:description => "Desc")
		assert_equal "Desc", event.description
	end

	# Test Case E51: Modify event's date
	# Input: event_date
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's date" do
		event = Event.first
		assert event.update_attributes(:event_date => (Date.today + 30))
		assert_equal (Date.today + 30), event.event_date
	end

	# Test Case E52: Modify event's start time
	# Input: start_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's start time" do
		event = Event.first
		assert event.update_attributes(:start_time => "14:00")
		assert_equal "14:00", event.start_time.strftime('%H:%M')
	end

	# Test Case E53: Modify event's end time
	# Input: end_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's end time" do
		event = Event.first
		assert event.update_attributes(:end_time => "16:00")
		assert_equal "16:00", event.end_time.strftime('%H:%M')
	end

	# Test Case E54: Modify event's image
	# Input: image
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's image" do
		event = Event.first
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert event.save
	end

	# Test Case E55: Modify event's user id and name
	# Input: user_id, name
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's user id and name" do
		event = Event.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { event.update_attributes(:user_id => User.first.id, :name => "Test") }
	end

	# Test Case E56: Modify event's user id and description
	# Input: user_id, description
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's user id and description" do
		event = Event.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { event.update_attributes(:user_id => User.first.id, :description => "Description") }
	end

	# Test Case E57: Modify event's user id and event date
	# Input: user_id, event_date
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's user id and event date" do
		event = Event.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { event.update_attributes(:user_id => User.first.id, :event_date => (Date.today + 30)) }
	end

	# Test Case E58: Modify event's user id and start time
	# Input: user_id, start_time
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's user id and start time" do
		event = Event.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { event.update_attributes(:user_id => User.first.id, :start_time => "14:00") }
	end

	# Test Case E59: Modify event's user id and end time
	# Input: user_id, end_time
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's user id and end time" do
		event = Event.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { event.update_attributes(:user_id => User.first.id, :end_time => "12:00") }
	end

	# Test Case E60: Modify event's user id and image
	# Input: user_id, image
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's user id and image" do
		event = Event.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { event.update_attributes(:user_id => User.first.id, :image => "Hello.jpg") }
	end

	# Test Case E61: Modify event's name and description
	# Input: name, description
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's name and description" do
		event = Event.first
		assert event.update_attributes(:name => "Name", :description => "Desc")
		assert_equal "Name", event.name
		assert_equal "Desc", event.description
	end

	# Test Case E62: Modify event's name and event date
	# Input: name, event_date
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's name and event date" do
		event = Event.first
		assert event.update_attributes(:name => "Name", :event_date => (Date.today + 30))
		assert_equal "Name", event.name
		assert_equal (Date.today + 30), event.event_date
	end

	# Test Case E63: Modify event's name and start time
	# Input: name, start_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's name and start time" do
		event = Event.first
		assert event.update_attributes(:name => "Name", :start_time => "14:00")
		assert_equal "Name", event.name
		assert_equal "14:00", event.start_time.strftime('%H:%M')
	end

	# Test Case E64: Modify event's name and end time
	# Input: name, end_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's name and end time" do
		event = Event.first
		assert event.update_attributes(:name => "Name", :end_time => "15:00")
		assert_equal "Name", event.name
		assert_equal "15:00", event.end_time.strftime('%H:%M')
	end

	# Test Case E66: Modify event's name and image
	# Input: name, image
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's name and image" do
		event = Event.first
		event.name = "Name"
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert event.save
		assert_equal "Name", event.name
	end

	# Test Case E67: Modify event's description and start time
	# Input: description, start_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's description and start time" do
		event = Event.first
		assert event.update_attributes(:description => "Desc", :start_time => "14:00")
		assert_equal "Desc", event.description
		assert_equal "14:00", event.start_time.strftime('%H:%M')
	end

	# Test Case E68: Modify event's description and end time
	# Input: description, end_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's description and end time" do
		event = Event.first
		assert event.update_attributes(:description => "Desc", :end_time => "15:00")
		assert_equal "Desc", event.description
		assert_equal "15:00", event.end_time.strftime('%H:%M')
	end

	# Test Case E69: Modify event's description and image
	# Input: description, image
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's description and image" do
		event = Event.first
		event.description = "Desc"
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert event.save
		assert_equal "Desc", event.description
	end

	# Test Case E70: Modify event's date and start time
	# Input: event_date, start_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's date and start time" do
		event = Event.first
		assert event.update_attributes(:event_date => (Date.today + 30), :start_time => "14:00")
		assert_equal (Date.today + 30), event.event_date
		assert_equal "14:00", event.start_time.strftime('%H:%M')
	end

	# Test Case E71: Modify event's date and end time
	# Input: event_date, end_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's date and end time" do
		event = Event.first
		assert event.update_attributes(:event_date => (Date.today + 30), :end_time => "15:00")
		assert_equal (Date.today + 30), event.event_date
		assert_equal "15:00", event.end_time.strftime('%H:%M')
	end

	# Test Case E72: Modify event's date and image
	# Input: event_date, image
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's date and image" do
		event = Event.first
		event.event_date = Date.today + 30
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert event.save
		assert_equal (Date.today + 30), event.event_date
	end

	# Test Case E73: Modify event's start time and end time
	# Input: start_time, end_time
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's start time and end time" do
		event = Event.first
		assert event.update_attributes(:start_time => "14:00", :end_time => "15:00")
		assert_equal "14:00", event.start_time.strftime('%H:%M')
		assert_equal "15:00", event.end_time.strftime('%H:%M')
	end

	# Test Case E74: Modify event's start time and image
	# Input: start_time, image
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's start time and image" do
		event = Event.first
		event.start_time = "14:00"
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert event.save
		assert_equal "14:00", event.start_time.strftime('%H:%M')
	end

	# Test Case E75: Modify event's end time and image
	# Input: end_time, image
	# Expected Output: Event is updated
	# Actual Output: Event is updated

	test "modify event's end time and image" do
		event = Event.first
		event.end_time = "15:00"
		event.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert event.save
		assert_equal "15:00", event.end_time.strftime('%H:%M')
	end

	# Test Case E76: Modify event's start time to be after event's end time
	# Input: start_time, end_time
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's start time to be after end time" do
		event = Event.first
		assert !event.update_attributes(:start_time => "14:00", :end_time => "12:00")
	end

	# Test Case E77: Modify event's end time to be before event's start time
	# Input: start_time, end_time
	# Expected Output: Event is not updated
	# Actual Output: Event is not updated

	test "modify event's end time to be before start time" do
		event = Event.first
		assert !event.update_attributes(:end_time => "14:00", :start_time => "15:00")
	end

	
# -------------- End Modify Event ------------------

# -------------- Read Event ------------------

	# Test Case E81: Read event where event ID exists
	# Input: id
	# Expected Output: Event with specified id
	# Actual Output: Event with specified id

	test "read event where event id exists" do
		event = Event.first
		assert_equal Event.first.id, event.id
	end

	# Test Case E82: Read event where event ID does not exist
	# Input: id
	# Expected Output: RecordNotFound error
	# Actual Output: RecordNotFound error

	test "read event where event id does not exist" do
		assert_raise(ActiveRecord::RecordNotFound) { Event.find(0) }
	end


# -------------- End Read Event ------------------

# -------------- Delete Event ------------------

# Test Case E83: Delete event 
# Input: id
# Expected Output: Event is deleted
# Actual Output: Event is deleted

test "delete event where event id exists" do
	event = Event.first
	id = Event.first.id
	event.destroy
	assert_raise(ActiveRecord::RecordNotFound) { Event.find(id) }
end

# -------------- End Delete Event ------------------
end