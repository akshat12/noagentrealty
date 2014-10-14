require 'test_helper'

# Unit Tests for User Model

class UserTest < ActiveSupport::TestCase

# --------------- Create User ----------------------

	 # Test Case U00: New User (Empty)

	 # Precondition: Create a new user with empty attributes.
	 # Precondition: I am changing it to: User which is to be added
	 #               is not already there. Proposal to change this 
	 #               across all test cases.
	 
	 # Input: New user with empty attributes.
	 # Expected Output: User is not saved (user.save = false)
	 # Actual Output: User is not saved
   test "should not save user with empty fields" do
   	user = User.new
   	assert !user.save, "Saved user with empty fields"
   end

   # Test Case U01: New User (Name Only)

   # Precondition: Create a new user with the name attribute only.
   # Input: New user with name attribute only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with name only" do
   	user = User.new(:name => "Name")
   	assert !user.save, "Saved user with name only"
   end

   # Test Case U02: New User (Email Only)

   # Precondition: Create a new user with the email attribute only.
   # Input: New user with email attribute only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with email only" do
   	user = User.new(:email => "test@test.com")
   	assert !user.save, "Saved user with email only"
   end

   # Test Case U03: New User (Password Only - No Confirmation)

   # Precondition: Create a new user with the password attribute only.
   # Input: New user with password attribute only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with password only" do
   	user = User.new(:password => "abc123")
   	assert !user.save, "Saved user with password only"
   end

   # Test Case U04: New User (Password Only - With Confirmation)

   # Precondition: Create a new user with the password attribute and confirmation only.
   # Input: New user with password attribute and confirmation only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with password and confirmation only" do
   	user = User.new(:password => "abc123", :password_confirmation => "abc123")
   	assert !user.save, "Saved user with password and confirmation only"
   end 

   # Test Case U05: New User (Name and Email Only)

   # Precondition: Create a new user with the name and email attribute only.
   # Input: New user with name and email attribute only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with name and email only" do
   	user = User.new(:name => "Name", :email => "test@test.com")
   	assert !user.save, "Saved user with name and email only"
   end

   # Test Case U06: New User (Name and Password Only - No Confirmation)

   # Precondition: Create a new user with the name and password attribute only.
   # Input: New user with name and password attribute only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with name and password only" do
   	user = User.new(:name => "Name", :password => "abc123")
   	assert !user.save, "Saved user with name and password only"
   end

   # Test Case U07: New User (Name and Password Only - With Confirmation)

   # Precondition: Create a new user with the name and password attribute and confirmation only.
   # Input: New user with name and password attribute and confirmation only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with name and password and confirmation only" do
   	user = User.new(:name => "Name", :password => "abc123", :password_confirmation => "abc123")
   	assert !user.save, "Saved user with name and password and confirmation only"
   end

   # Test Case U08: New User (Email and Password Only - No Confirmation)

   # Precondition: Create a new user with the email and password attribute only.
   # Input: New user with email and password attribute only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with email and password only" do
   	user = User.new(:email => "test@test.com", :password => "abc123")
   	assert !user.save, "Saved user with email and password only"
   end

   # Test Case U09: New User (Email and Password Only - With Confirmation)

   # Precondition: Create a new user with the email and password attribute and confirmation only.
   # Input: New user with email and password attribute and confirmation only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is not saved
   test "should not save user with email and password and confirmation only" do
   	user = User.new(:email => "test@test.com", :password => "abc123", :password_confirmation => "abc123")
   	assert !user.save, "Saved user with email and password and confirmation only"
   end

   # Test Case U10: New User (Name and Email and Password Only - No Confirmation)

   # Precondition: Create a new user with the name and email and password attribute only.
   # Input: New user with name and email and password attribute only
   # Expected Output: User is not saved (user.save = false)
   # Actual Output: User is saved
   test "U10" do
   	user = User.new(:name => "Name", :email => "test@test.com", :password => "abc123")
   	assert !user.save, "Saved user with name and email and password only"
   end

   # Test Case U11: New User (Name and Email and Password - With Confirmation)

   # Precondition: Create a new user with the name and email and password attribute with confirmation.
   # Input: New user with name and email and password attribute with confirmation
   # Expected Output: User is saved (user.save = true)
   # Actual Output: User is saved
   test "should save user with name and email and password with confirmation" do
   	user = User.new(:name => "Name", :email => "test@test.com", :password => "abc123", :password_confirmation => "abc123")
   	assert user.save, "Did not save user with name and email and password with confirmation"
   end
   
   # Test Case U12: New User (Name, Email, Password, Confirmation, Image)
   
   # Precondition: User doesn't already exist
   # Input: New user with name, email, password, confirmation and an image
   # Expected Output: User is saved with the image attached
   # Actual Output: User is saved
   
   test "should save user with name, email, password, confirmation and image" do
	user = User.new(:name => "Name", :email => "test@example.com", :password => "abc123", :password_confirmation => "abc123", :image => "hello.jpg")
	assert user.save, "saved user"
   end
   
   
   # Test Case U13: New User (Name, Email, Password - With different confirmation)
   
   # Precondition: User doesn't already exist
   # Input: Name, Email, Password, Different Confirmation
   # Expected Output: User is not saved
   # Actual Output: User is not saved   
   
	test "password and different confirmation" do
		user = User.new(:name => "Name", :email => "email@example.com", :password => "abc123", :password_confirmation => "abc132")
		assert !user.save, "insert comment"
	end

# --------------- Create User Above ----------------

# --------------- Update User Below ----------------



   # Test Case U14: User wants to change email
   
   # Precondition: User already exists and logged on
   # Input: Email
   # Expected Output: User updated with new email
   # Actual Output: User updated with new email
   
	test "change email" do
		users(:search_user1).update_attributes(:email => "est@example.com")
		assert_equal "est@example.com", users(:search_user1).email
	end
	

   	# Test Case U17: User wants to change image
   
	# Precondition: User already exists and logged on
	# Input: Image
	# Expected Output: User updated with image changed
	# Actual Output: Test not permitted due to security reasons
	
	#----------------ERROR-------------------------------------------
	#test "c image" do
	#	users(:search_user1).update_attributes(:image => "ffa.jpg")
	#	assert_equal "ffa.jpg", users(:search_user1).image
	#end
	#----------------ERROR-------------------------------------------
	
	
	# Test Case U18: User wants to change name and email
   
	# Precondition: User already exists and logged in
	# Input: Name and email
	# Expected Output: User updated with new name and email
	# Actual Output: User updated with new name and email  
	
	test "c name, email" do
		users(:search_user1).update_attributes(:name => "Foxtrot", :email => "fox@gmail.com")
		assert_equal "Foxtrot", users(:search_user1).name
		assert_equal "fox@gmail.com", users(:search_user1).email
	end
   
	# Test Case U19: User wants to change name
   
	# Precondition: User already exists and logged in
	# Input: name
	# Expected Output: name changed 
	# Actual Output: Name changed

	test "U19" do
		users(:search_user1).update_attributes(:name => "Tony")
		assert_equal "Tony", users(:search_user1).name
	end

   
   # Test Case U21: User wants to change name and image
   # Note: Test wont change image due to security reasons
   # Precondition:
   # Input:
   # Expected Output:
   # Actual Output: TBD
   
   

	# Test Case U24: User wants to change name, email, and image
	# Note: Test wont change image due to security reasons
	# Precondition:
	# Input:
	# Expected Output:
	# Actual Output: TBD
   
   
	# Test Case U29: User wants to change email and image
	# Note: Test wont change image due to security reasons
	# Precondition:
	# Input:
	# Expected Output:
	# Actual Output: TBD
   
   
# --------------- Update User Above ----------------

# --------------- Read User Below ------------------

	# Test Case U36: Find user by ID when user exists
   
	# Precondition: User exists	
	# Input: ID
	# Expected Output: User
	# Actual Output: User
	
	test "U36" do
		@user = User.find(users(:search_user2).id)
		assert_equal "user two", @user.name
		assert_equal "user@too.com", @user.email
		assert_equal "AA", @user.password_digest
	end
   
   
   # Test Case U37: Find user by ID when user does not exist
   
   # Precondition: User doesn't exist
   # Input: ID
   # Expected Output: NULL
   # Actual Output: NULL
   
	test "U37" do
		assert_raise(ActiveRecord::RecordNotFound) {(User.find("0"))}
	end
	
   
# --------------- Read User Above ------------------
# --------------- Delete User Below ----------------   
   # Test Case U38: Deleting user when user exists by ID
   
   # Precondition: User exists
   # Input: ID
   # Expected Output: User deleted
   # Actual Output: User deleted
   
	test "U38" do
		users(:search_user2).destroy
	end

   # Test Case U39: Deleting user when user doesn't exist by ID
   
   # Precondition: User doesn't exist
   # Input: ID
   # Expected Output: NULL
   # Actual Output: NULL
   
   test "U39" do
		assert_raise(ActiveRecord::RecordNotFound) {(User.find(:"000"))} # Destroy function works on finding the item first
	end		
# --------------- Delete User ----------------------   
   

end