# /test/unit/proj_test.rb

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
	
# -------------- Create Project ------------------

	# Test Case P00: Creating an project with only name

	# Precondition: Project doesn't already exist 
	# Input: name
	# Expected Output: Project is not created
	# Actual Output: Project is not created

	test "create project with name only" do
		proj = Project.new(:name => "Deconstruction Sale")
		assert !proj.save, "Saved the project with name only"
	end

	# Test Case P01: Creating an project with only description

	# Precondition: Project doesn't already exist 
	# Input: description
	# Expected Output: Project is not created
	# Actual Output: Project is not created

	test "create project with description only" do
		proj = Project.new(:description => "Test Description")
		assert !proj.save, "Saved the project with description only"
	end

     # Test Case P02: Creating an project with description & image

	# Precondition: Project doesn't already exist 
	# Input: description, image
	# Expected Output: Project is not created
	# Actual Output: Project is not created

	test "create project with description and image only" do
		proj = Project.new(:description => "Description")
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert !proj.save, "Saved the project with description and image only"
	end

      # Test Case P03: Creating an project with name *& image

	# Precondition: Project doesn't already exist 
	# Input: description, image
	# Expected Output: Project is not created
	# Actual Output: Project is not created


	test "create project with name and image only" do
		proj = Project.new(:name => "name")
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert !proj.save, "Saved the project with description and image only"
	end


       # Test Case P04: Creating an project with only description and name

	# Precondition: Project doesn't already exist 
	# Input: description, name
	# Expected Output: Project is not created
	# Actual Output: Project is not created

	test "create project with description and name" do
		proj = Project.new(:name => 'myName', :description => "Description")
		assert !proj.save, "Saved the project with description and image only"
	end


        # Test Case P05: Creating an project with only description, name and image

	# Precondition: Project doesn't already exist 
	# Input: description, name, image
	# Expected Output: Project is not created
	# Actual Output: Project is not created
	test "create project with description, name and image " do
		proj = Project.new(:description => "Description", :name => 'my Name')
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert !proj.save, "Saved the project with description and image only"
	end

        # Test Case P06: Creating an project with all attributes

	# Precondition: Project doesn't already exist 
	# Input: description, image, name, user id
	# Expected Output: Project is created
	# Actual Output: Project is created

        test "create project with description, name, image & user id " do
		proj = Project.new(:description => "Description", :name => 'my Name')
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
                proj.user_id = User.first.id
		assert proj.save, "Saved the project with description and image only"
	end

       # Test Case P07: Creating an project with name, user id and image

	# Precondition: Project doesn't already exist 
	# Input: name, image, user id
	# Expected Output: Project is not created
	# Actual Output: Project is not created

        test "create project with  name, image & user id " do
		proj = Project.new(:name => 'my Name')
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
                proj.user_id = User.first.id
		assert !proj.save, "Saved the project with description and image only"
	end

       # Test Case P08: Creating an project with only description, image & user id

	# Precondition: Project doesn't already exist 
	# Input: description, image and user id
	# Expected Output: Project is not created
	# Actual Output: Project is not created

        test "create project with description, image & user id " do
		proj = Project.new(:description => "Description")
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
                proj.user_id = User.first.id
		assert !proj.save, "Saved the project with description and image only"
	end


       # Test Case P09: Creating an project with only description, name and user id

	# Precondition: Project doesn't already exist 
	# Input: description, name and user id
	# Expected Output: Project is created
	# Actual Output: Project is created
        test "create project with description, name, user id " do
		proj = Project.new(:description => "Description", :name => 'my Name')
                proj.user_id = User.first.id
		assert proj.save, "Saved the project with description and image only"
	end


	
#------------- End Create Project --------------------

# -------------- Modify Project ------------------

	# Test Case 10: Modify project's user id
	# Input: user_id
	# Expected Output: Project is not updated
	# Actual Output: Project is not updated

	test "modify proj's user id" do
		proj = Project.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { proj.update_attributes(:user_id => User.first.id) }
	end

	# Test Case P11: Modify project's name
	# Input: name
	# Expected Output: Project is updated
	# Actual Output: Project is updated

	test "modify proj's name" do
		proj = Project.first
		assert proj.update_attributes(:name => "Name")
		assert_equal "Name", proj.name
	end


	# Test Case P12: Modify project's image
	# Input: image
	# Expected Output: Project is updated
	# Actual Output: Project is updated

	test "modify proj's image" do
		proj = Project.first
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert proj.save
	end

	# Test Case P13: Modify project's user id and name
	# Input: user_id, name
	# Expected Output: Project is not updated
	# Actual Output: Project is not updated

	test "modify proj's user id and name" do
		proj = Project.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { proj.update_attributes(:user_id => User.first.id, :name => "Test") }
	end

	# Test Case P14: Modify project's user id and description
	# Input: user_id, description
	# Expected Output: Project is not updated
	# Actual Output: Project is not updated

	test "modify proj's user id and description" do
		proj = Project.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { proj.update_attributes(:user_id => User.first.id, :description => "Description") }
	end

	# Test Case P15: Modify project's user id and image
	# Input: user_id, image
	# Expected Output: Project is not updated
	# Actual Output: Project is not updated

	test "modify proj's user id and image" do
		proj = Project.first
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) { proj.update_attributes(:user_id => User.first.id, :image => "Hello.jpg") }
	end

	# Test Case P16: Modify project's name and description
	# Input: name, description
	# Expected Output: Project is updated
	# Actual Output: Project is updated

	test "modify proj's name and description" do
		proj = Project.first
		assert proj.update_attributes(:name => "Name", :description => "Desc")
		assert_equal "Name", proj.name
		assert_equal "Desc", proj.description
	end

	

	# Test Case P17: Modify project's name and image
	# Input: name, image
	# Expected Output: Project is updated
	# Actual Output: Project is updated

	test "modify proj's name and image" do
		proj = Project.first
		proj.name = "Name"
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert proj.save
		assert_equal "Name", proj.name
	end



	# Test Case P18: Modify project's description and image
	# Input: description, image
	# Expected Output: Project is updated
	# Actual Output: Project is updated

	test "modify proj's description and image" do
		proj = Project.first
		proj.description = "Desc"
		proj.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert proj.save
		assert_equal "Desc", proj.description
	end

	
# -------------- End Modify Project ------------------

# -------------- Read Project ------------------

	# Test Case P19: Read project where proj ID exists
	# Input: id
	# Expected Output: Project with specified id
	# Actual Output: Project with specified id

	test "read proj where proj id exists" do
		proj = Project.first
		assert_equal Project.first.id, proj.id
	end

	# Test Case P20: Read project where proj ID does not exist
	# Input: id
	# Expected Output: RecordNotFound error
	# Actual Output: RecordNotFound error

	test "read proj where proj id does not exist" do
		assert_raise(ActiveRecord::RecordNotFound) { Project.find(0) }
	end


# -------------- End Read Project ------------------

# -------------- Delete Project ------------------

# Test Case P21: Delete project 
# Input: id
# Expected Output: Project is deleted
# Actual Output: Project is deleted

test "delete proj where proj id exists" do
	proj = Project.first
	id = Project.first.id
	proj.destroy
	assert_raise(ActiveRecord::RecordNotFound) { Project.find(id) }
end

# -------------- End Delete Project ------------------
end
