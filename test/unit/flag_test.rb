require 'test_helper'

# Unit Tests for flag Model

class FlagTest < ActiveSupport::TestCase

# --------------- Create Flag ----------------------

	 # Test Case F00: Create Flag(Reason only)

	 # Precondition: Flag doesn't exist
	
	 # Input:Reason
	 # Expected Output:Flag isn't created
	 # Actual Output: flag not saved 
   test "should not save flag with only reason" do
        flag = Flag.new()
        flag.reason = "HI"
   	assert !flag.save, "Saved flag with only reason"
   end

   # Test Case F01: Create Flag (Comment Only)

   # Precondition: Flag doesn't exist
   # Input: New Falg with comment attribute only
   # Expected Output: Flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with comment only" do
        flag = Flag.new()
        flag.comment = "HI"
   	assert !flag.save, "Saved flag with comment only"
   end

   # Test Case F02: New Flag (flag id Only)

   # Precondition: Create a new Flag with the id attribute only.
   # Input: New Flag with id attribute only
   # Expected Output: Flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with id only" do
   	flag = Flag.new()
        flag.flaggable_id = Item.first.id
   	assert !flag.save, "Saved flag with id only"
   end

   # Test Case F03: New flag (flaggable type only)

   # Precondition: Create a new flag with flag type.
   # Input: New flag with flag type attribute only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with flag type only" do
        flag = Flag.new()
        flag.flaggable_type = "Project"
   	assert !flag.save, "Saved flag with type only"
   end

   # Test Case F04: New flag (user id only)

   # Precondition: Create a new flag with user_id only.
   # Input: New flag with user_id only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with user_id only" do
   	flag = Flag.new()
        flag.user_id = User.first.id
   	assert !flag.save, "Saved flag with user id only"
   end 

   # Test Case F05: New flag (Reason & Comment Only)

   # Precondition: Create a new flag with the reason and comment attribute only.
   # Input: New flag with reason and comment attribute only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with reason and comment only" do
        flag = Flag.new()
        flag.reason = "Resonn"
        flag.comment = "Naw"
   	assert !flag.save, "Saved flag with reason and comment only"
   end

   # Test Case F06: New flag (Reason and flag_id)

   # Precondition: Create a new flag with the reason and id only.
   # Input: New flag with reason and id attribute only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with reason and id only" do
        flag = Flag.new()
        flag.flaggable_id = Item.first.id
        flag.reason = "Resonn"
   	assert !flag.save, "Saved flag with reaon and id only"
   end

   # Test Case U07: New flag (reason and flag type)

   # Precondition: Create a new flag with the reason and flag type atttributes only.
   # Input: New flag with reason and flag type attributes only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with reason and flag type only" do
        flag = Flag.new()
        flag.flaggable_type = "User"
        flag.reason = "Resonn"
   	assert !flag.save, "Saved flag with reason and flag type only attributes"
   end

   # Test Case F08: New flag (Reason and user id Only)

   # Precondition: Create a new flag with the Reason and user id attribute only.
   # Input: New flag with reason and user id attribute only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with reason and user id only" do
        flag = Flag.new()
        flag.user_id = User.first.id
        flag.reason = "Resonn"
   	assert !flag.save, "Saved flag with reason and user_id only"
   end

   # Test Case F09: New flag (comment and flag id)

   # Precondition: Create a new flag with the comment and flag id attributes only.
   # Input: New flag with comment and flaggable_id attributes only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with comment and flag id only" do
        flag = Flag.new()
        flag.flaggable_id = Item.first.id
        flag.comment = "myComment"
   	assert !flag.save, "Saved flag with comment and flag id only"
   end

   # Test Case F10: New flag (comment and flag type)

   # Precondition: Create a new flag with the comment & flag type attributes only.
   # Input: New flag with comment and flag type attributes only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved 
   test "should not save flag with comment and flag type attributes only" do
        flag = Flag.new()
        flag.flaggable_type = "Item" 
        flag.comment = "comment"
   	assert !flag.save, "Saved flag with comment and flag type only"
   end

   # Test Case F11: New flag (comment and user id)

   # Precondition: Create a new flag with comment and user_id.
   # Input: New flag with comment and user_id attributes only
   # Expected Output: flag is not saved (flag.save = false)
   # Actual Output: flag not saved flag is saved
   test "should not save flag with comment and user_id onlt" do
        flag = Flag.new()
        flag.user_id = User.first.id
        flag.comment = "hiya"
   	assert !flag.save, "saved flag with comment and user id only"
   end
   
   # Test Case F12: New flag (flag id and type only)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag_id and type only
   # Expected Output: flag is not saved
   # Actual Output: flag not saved 
   
   test "should not save flag with flag_id and type only" do
        flag = Flag.new()
        flag.flaggable_id = Item.first.id
        flag.flaggable_type = "Item"
       assert !flag.save, "saved flag with flag id and type only"
   end
   
   
   # Test Case F13: New flag (flag id and user id only)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag id and user id only
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
    test "should not save flag with flag id and user id only" do
           flag = Flag.new()
           flag.flaggable_id = Item.first.id
           flag.user_id = User.first.id
	   assert !flag.save, "saved flag with flag id and user id only"
    end

# Test Case F14: New flag (flag type and user id only)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag type and user id only
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with flag type and user id only" do
                flag = Flag.new()
                flag.user_id = User.first.id
                flag.flaggable_type = "Event"
		assert !flag.save, "saved flag with flag type and user id only"
	end

  # Test Case F15: New flag (all required fields)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag id,reason,comment and user id 
   # Expected Output: flag is saved
   # Actual Output: flag saved
   
	test "should save flag with all required fileds" do
                 flag = Flag.new()
                 flag.user_id = User.first.id
                 flag.reason = "Reason"
                 flag.comment = "Comment"
                 flag.flaggable_id = Item.first.id
                 flag.flaggable_type = "Item"
		 assert flag.save, "did not save flag with all required fields"
	end

  # Test Case F16: New flag (all required except for user id)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag id, reason  &comment
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but user id" do
                flag = Flag.new()
                flag.flaggable_id = Item.first.id
                flag.comment = "comment"
                flag.reason = "Reason"
		assert !flag.save, "saved flag with all required fields but user id"
	end

# Test Case F17: New flag (all required except for flag id)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with user id, reason  &comment
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but flag id" do
               flag = Flag.new()
                flag.user_id = User.first.id
                flag.reason = "MyReason"
                flag.comment = "flaggged"
		assert !flag.save, "saved flag with all required fields but flag id"
	end

# Test Case F18: New flag (all required except for reason)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with user id, flag id  & comment
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but reason" do
                flag = Flag.new()
                flag.user_id = User.first.id
                flag.flaggable_id = Item.first.id
                flag.comment = "comment"
		assert !flag.save, "saved flag with all required fields but reason"
	end

# Test Case F19: New flag (all required except for comment)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with user id, flag id  & reason
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but comment" do
                flag = Flag.new()
                flag.user_id = User.first.id
                flag.flaggable_id = Item.first.id
                flag.comment = "hiya"
		assert !flag.save, "saved flag with all required fields but comment"
	end

# Test Case F20: New flag (all required except for user id and flag id)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with comment & reason
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but user id and flag id" do
                flag = Flag.new()
                flag.comment = "comment"
                flag.reason = "reason"
		assert !flag.save, "saved flag with all required fields but user id and flag id"
	end

# Test Case F21: New flag (all required except for user id and reason)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag id & comment
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but user id and reason" do
                flag = Flag.new()
                flag.flaggable_id = Item.first.id
                flag.comment = "comment"
		assert !flag.save, "saved flag with all required fields but user id and reason"
	end

# Test Case F22: New flag (all required except for user id and comment)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag id & reason
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but user id and comment" do
                flag = Flag.new()
                flag.user_id = User.first.id
                flag.reason = "Reason"
		assert !flag.save, "saved flag with all required fields but user id and comment"
	end

# Test Case F23: New flag (all required except for flag id and reason)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with user id & comment
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but flag id and reason" do
                flag = Flag.new()
                flag.user_id = User.first.id
                flag.comment = "comment"
		assert !flag.save, "saved flag with all required fields but flag id and reason"
	end

# Test Case F24: New flag (all required except for flag id and comment)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with user id & reason
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but flag id and comment" do
                flag = Flag.new()
                flag.user_id = User.first.id
                flag.reason = "Reeson"
		assert !flag.save, "saved flag with all required fields but flag id and comment"
	end

# Test Case F25: New flag (all required except for reason and comment)
   
   # Precondition: flag doesn't already exist
   # Input: New flag with flag id & user id
   # Expected Output: flag is not saved
   # Actual Output: flag not saved
   
	test "should not save flag with all required fields but reason and comment" do
                flag = Flag.new()
                flag.user_id = User.first.id
                flag.flaggable_id = Item.first.id
		assert !flag.save, "saved flag with all required fields but reason and comment"
	end

# Test Case F26: delete flag where flag id exists
   
   # Precondition: flag already exist
   # Input:flag id 
   # Expected Output: flag is deleted
   # Actual Output: flag not saved
   
	test "delete flag with flag id" do
		flag = Flag.find(1)
		assert flag.destroy, "flag was not destroyed"
	end



  
end
