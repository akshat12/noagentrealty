require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
# -------------- Create Item ------------------

	# Test Case I00: Creating an item without any fiels
   
	# Precondition: void
	# Input: void
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	
	test "create item without fields" do
		item = Item.new
		item.location = Location.new
		assert !item.save
	end
# Test Case I01: Creating an item with only required fields
   
	# Precondition: void
	# Input: Base variables needed to create item
	# Expected Output: Item created
	# Actual Output: Item created	
	
	test "create item with name only" do
		@date = Date.today.next_day
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date.next_month)
	        @item.location = Location.new
		@item.user_id = 1
		assert @item.save
	end
	# Test Case I02: Creating an item with all required fields except for user_id
   
	# Precondition: void
	# Input: all required fields except for user_id
	# Expected Output: Item not created
	# Actual Output: Item not created
	
	test "create item without user_id" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I03: Creating an item with all required fields except for name
   
	# Precondition: void
	# Input: all required fields except for name
	# Expected Output: Item not created
	# Actual Output: Item not created
	
	test "create item without name" do
		@date = Date.today
		@item = Item.new(:category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date)
		@item.location = Location.new
		@item.user_id = 1
		assert !@item.save
	end
	
	# Test Case I04: Creating an item with all required fields except for description
   
	# Precondition: void
	# Input: all required fields except for description
	# Expected Output: Item not created
	# Actual Output: Item not created
	
	test "create item without description" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	# Test Case I05: Creating an item with all required fields except for category
   
	# Precondition: void
	# Input: all required fields except for category
	# Expected Output: Item not created
	# Actual Output: Item not created 
	test "create item without category" do
		@date = Date.today
		@item = Item.new(:name => "hello", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I06: Creating an item with all required fields except for quantity
   
	# Precondition: void
	# Input: all required fields except for quantity
	# Expected Output: Item not created
	# Actual Output: Item not created
	test "create item without quantity" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :available_from => @date, :available_until => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I07: Creating an item with all required fields except for condition
   
	# Precondition: void
	# Input: all required fields except for condition
	# Expected Output: Item not created
	# Actual Output: Item not created
	test "create item without condition" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :quantity => 2, :available_from => @date, :available_until => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I08: Creating an item with all required fields except for availble_from
   
	# Precondition: void
	# Input: all required fields except for availble_from
	# Expected Output: Item not created
	# Actual Output: Item not created
	test "create item without available_from" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_until => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I09: Creating an item with all required fields except for available_unti
   
	# Precondition: void
	# Input: all required fields except for available_until
	# Expected Output: Item not created
	# Actual Output: Item not created
	test "create item without available_until" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I10: Creating an item with all required fields and quantity = 0 
   
	# Precondition: void
	# Input: all required fields with quantity = 0
	# Expected Output: Item not created
	# Actual Output: Item not created
	test "create item with quantity = 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 0, :available_from => @date, :available_until => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I11: Creating an item with quantity < 0 
   
	# Precondition: void
	# Input: all required fields with quantity < 0
	# Expected Output: Item not created
	# Actual Output: Item not created
	test "create item with quantity < 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => -2, :available_from => @date, :available_until => @date)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# -------------------- Failure Below-----------------------------
	# Test Case I12: Creating an item with available_from before current date 
   
	# Precondition: void
	# Input: all required fields with available_from before current date
	# Expected Output: Item not saved
	# Actual Output: Item saved
	test "create item with available_from before todays date" do
		@datea = Date.new(2007, 11, 10)
		@dateu = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @datea, :available_until => @dateu)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	# -------------------- Failure Above-----------------------------
	
	# -------------------- Failure Below-----------------------------
	# Test Case I13:  Creating an item with availble_until before todays date
   
	# Precondition: void
	# Input: all required fields with available_until before todays date
	# Expected Output: Item not saved
	# Actual Output: Item saved
	test "create item with availble_until before todays date" do
		@datea = Date.new(2007, 10, 10)
		@dateu = Date.new(2007, 11, 10)
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @datea, :available_until => @dateu)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	# -------------------- Failure Above-----------------------------
	
	# Test Case I14: Creating an item with aviablle_until after todays date
   
	# Precondition: void
	# Input: all required fields with available_until after todays date
	# Expected Output: Item saved
	# Actual Output: Item saved
	test "create item with availble_until after todays date" do
		@datea = Date.today
		@dateu = Date.new(2013, 11, 10)
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @datea, :available_until => @dateu)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save

	end
	
	
	# Test Case I15:  Creating an item with available from after todays date
   
	# Precondition: void
	# Input: all required fields with available_from after todays date
	# Expected Output: Item saved
	# Actual Output: Item saved
	test "create item with availble_from after todays date" do
		@datea = Date.new(2013, 04, 05) # 5 april
		@dateu = Date.new(2013, 11, 10) # 10 November 
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @datea, :available_until => @dateu)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# -------------------- Failure Below-----------------------------
	# Test Case I16: 
   
	# Precondition: void
	# Input: all required fields with available_from after available_until date
	# Expected Output: Item not saved
	# Actual Output: Item saved
	test "create item with availble_from after available_until date" do
		@datea = Date.new(2013, 11, 10)
		@dateu = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @datea, :available_until => @dateu)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	# -------------------- Failure Above-----------------------------
	
	# Test Case I17:  Creating an item with length > 0
   
	# Precondition: void
	# Input: all required fields and length > 0
	# Expected Output: Item saved
	# Actual Output: Item not saved
	test "I17" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :length => 0.4)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I18:  Creating an item with length = 0
   
	# Precondition: void
	# Input: all required fields and length = 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with length = 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :length => 0)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I19: Creating an item with length < 0
   
	# Precondition: void
	# Input: all required fields and length < 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with length < 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :length => -0.452)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I20: Creating an item with width > 0
   
	# Precondition: void
	# Input: all required fields and width > 0
	# Expected Output: Item saved
	# Actual Output: Item saved
	test "I20" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :width => 1.4)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I21: Creating an item with width = 0
   
	# Precondition: void
	# Input: all required fields and width = 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with width = 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :width => 0)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I22: Creating an item with width < 0
   
	# Precondition: void
	# Input: all required fields and width < 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with width < 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :width => -0.452)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	
	# Test Case I23: Creating an item with height > 0
    
	# Precondition: void
	# Input: all required fields and height > 0
	# Expected Output: Item saved
	# Actual Output: Item saved
	test "I23" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :height => 0.4)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I24: Creating an item with height = 0
   
	# Precondition: void
	# Input: all required fields and height = 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "I24" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :height => 0)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I25: Creating an item with height < 0
   
	# Precondition: void
	# Input: all required fields and height < 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with height < 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :height => -0.452)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I26: Creating an item with weight = 0
   
	# Precondition: void
	# Input: all required fields and weight = 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with weight = 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :weight => 0)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I27: Creating an item with weight > 0
   
	# Precondition: void
	# Input: all required fields and weight > 0
	# Expected Output: Item saved
	# Actual Output: Item not saved
	test "I27" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :weight => 1)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I28: Creating an item with weight < 0
   
	# Precondition: void
	# Input: all required fields and weight < 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with weight < 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :weight => -0.452)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I29: Creating an item with price > 0
   
	# Precondition: void
	# Input: all required fields and price > 0
	# Expected Output: Item saved
	# Actual Output: Item not saved
	test "I29" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 0.4)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I30: Creating an item with price = 0
   
	# Precondition: void
	# Input: all required fields and price = 0
	# Expected Output: Item saved
	# Actual Output: Item not saved
	
        test "I30" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 0)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end

	
	
	# Test Case I31: Creating an item with price < 0 
   
	# Precondition: void
	# Input: all required fields and price < 0
	# Expected Output: Item not saved
	# Actual Output: Item not saved
	test "create item with price < 0" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => -0.452)
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I32: Creating an item with all fields 
	
	# Precondition: void
	# Input: all fields 
	# Expected Output: Item saved
	# Actual Output: Item not saved
	test "I32" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 4.99, :length => 3.2, :width => 2.3, :height => 2.3, :weight => 2.3)
		@item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I33: Creating an item with all fields except for image
   
	# Precondition: void
	# Input: all fields except for image
	# Expected Output:
	# Actual Output: TBD
	test "I33" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 4.99, :length => 3.2, :width => 2.3, :height => 2.32, :weight => 2.34)
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I34: Creating an item with all fields except for length
   
	# Precondition: void
	# Input: all fields except for length
	# Expected Output:
	# Actual Output: TBD
	test "I34" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 4.99, :width => 2.3, :height => 2.3, :weight => 2.3)
		@item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		@item.location = Location.new
		@item.user_id = 1
		assert @item.save
	end
	
	# Test Case I35: Creating an item with all fields except for width
   
	# Precondition: void
	# Input: all fields except for width
	# Expected Output:
	# Actual Output: TBD
	test "I35" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 4.99, :length => 3.2, :height => 2.3, :weight => 2.3)
		@item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I36: Creating an item with all fields except for height
   
	# Precondition: void
	# Input: all fields except for height
	# Expected Output:
	# Actual Output: TBD
	test "I36" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 4.99, :length => 3.2, :width => 2.3, :weight => 2.34)
		@item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I37: Creating an item with all fields except for price
   
	# Precondition: void
	# Input: all fields except for price
	# Expected Output:
	# Actual Output: TBD
	test "I37" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :length => 3.2, :width => 2.3, :height => 2.3, :weight => 2.3)
		@item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		@item.user_id = 1
		@item.location = Location.new
		assert @item.save
	end
	
	# Test Case I38: Creating an item with all fields except for weight
   
	# Precondition: void
	# Input: all fields except for weight
	# Expected Output:
	# Actual Output: TBD
	test "I38" do
		@date = Date.today
		@item = Item.new(:name => "hello", :category => "tony", :description => "just testing", :condition => "rough", :quantity => 2, :available_from => @date, :available_until => @date, :price => 4.99, :length => 3.2, :width => 2.3, :height => 2.3)
		@item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		@item.location = Location.new		
		@item.user_id = 1
		assert @item.save
	end

	# Test Case I39: Creating an item with only category
   
	# Precondition: void
	# Input: all fields except for category
	# Expected Output:
	# Actual Output: TBD
	
	test "create item with only category" do
		@item = Item.new(:category => "tony")
		@item.location = Location.new		
		assert !@item.save
	end
	
	# Test Case I40: Creating an item with only description
   
	# Precondition: void
	# Input: all fields except for description
	# Expected Output:
	# Actual Output: TBD
	test "create item with only description" do
		@item = Item.new(:description => "tony")
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I41: Creating an item with only user id
   
	# Precondition: void
	# Input: only user id
	# Expected Output:
	# Actual Output: TBD
	test "create item with only user_id" do
		@item = Item.new()
		@item.user_id = 1
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I42: Creating an item with only image
   
	# Precondition: void
	# Input: only image
	# Expected Output:
	# Actual Output: TBD
	test "create item with only image" do
		@item = Item.new()
		@item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I43: Creating an item with only quantity
   
	# Precondition: void
	# Input: only quantity
	# Expected Output:
	# Actual Output: TBD
	test "create item with only quantity" do
		@item = Item.new(:quantity => 4)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I44: Creating an item with only condition
   
	# Precondition: void
	# Input: only condition
	# Expected Output:
	# Actual Output: TBD
	test "create item with only condition" do
		@item = Item.new(:condition => "tony")
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I45: Creating an item with only length
   
	# Precondition: void
	# Input: only length
	# Expected Output:
	# Actual Output: TBD
	test "I45" do
		@item = Item.new(:length => 3.33)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I46: Creating an item with only width
   
	# Precondition: void
	# Input: only width
	# Expected Output:
	# Actual Output: TBD
	test "I46" do
		@item = Item.new(:width => 3.33)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I47: Creating an item with only height
   
	# Precondition: void
	# Input: only height
	# Expected Output:
	# Actual Output: TBD
	test "create item with only height" do
		@item = Item.new(:height => 3.33)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I48: Creating an item with only price
   
	# Precondition: void
	# Input: only price
	# Expected Output:
	# Actual Output: TBD
	test "create item with only price" do
		@item = Item.new(:price => 3.33)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I49: Creating an item with only available_from
   
	# Precondition: void
	# Input: only available_from
	# Expected Output:
	# Actual Output: TBD
	test "create item with only avail from" do
		@item = Item.new(:available_from => Date.today)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I50: Creating an item with only available_until
   
	# Precondition: void
	# Input: only available_until
	# Expected Output:
	# Actual Output: TBD
	test "create item with only avail until" do
		@item = Item.new(:available_until => Date.today)
		@item.location = Location.new
		assert !@item.save
	end
	
	# Test Case I51: Creating an item with only weight
   
	# Precondition: void
	# Input: only weight
	# Expected Output:
	# Actual Output: TBD
	test "create item with only weight" do
		@item = Item.new(:weight => 3.33)
		@item.location = Location.new
		assert !@item.save
	end
	
	#------------- End Create Item --------------------
	
	#------------- Begin Read Item 
	
	# Test Case I52: Find item by ID when item exists
   
	# Precondition: Item already exists
	# Input: Item ID
	# Expected Output: Item information related to that ID
	# Actual Output: TBD
	
	test "I52" do
		@item = Item.find(items(:test_required).id)
		assert_equal "Sierra", @item.name
		assert_equal "other", @item.category
		assert_equal "required", @item.description
		assert_equal 946095806, @item.user.id
		assert_equal 15, @item.quantity
		assert_equal "rough", @item.condition
		assert_equal Date.parse("2014-05-23"), @item.available_until
		assert_equal Date.parse("2013-05-24"), @item.available_from
	end
		
	
	# Test Case I53: Find item by ID when item does not exist
   
	# Precondition: Item doesn't exist
	# Input: Item ID
	# Expected Output: NULL
	# Actual Output: 
	
	test "I53" do
		assert_raise(ActiveRecord::RecordNotFound) {(Item.find("0"))}
	end

	#-------------- End Read Item -------------------
	
	#-------------- Begin Modify Item -------------------
	
	# Test Case I54: Change item name 
   
	# Precondition: Item already exists
	# Input: Name
	# Expected Output: Item updated with new name 
	# Actual Output: 
	
	test "I54" do
		items(:test_required).update_attributes(:name => "Tony")
		assert_equal "Tony", items(:test_required).name
	end
	
	# Test Case I55: Change item category
   
	# Precondition: Item already exists
	# Input: Category
	# Expected Output: Change item category
	# Actual Output: 
	
	test "I55" do
		items(:test_required).update_attributes(:category => "appliances")
		assert_equal "appliances", items(:test_required).category
	end	
	
	# Test Case I56: Change item description
   
	# Precondition: Item already exists 
	# Input: Description
	# Expected Output: Changed item description
	# Actual Output: 
	
	test "I56" do
		items(:test_required).update_attributes(:description => "changed it")
		assert_equal "changed it", items(:test_required).description
	end	
	
	
	# Test Case I57: Change item quantity
   
	# Precondition: Item already exists
	# Input: quantity
	# Expected Output: Changed item quantity
	# Actual Output: 
	
	test "I57" do
		items(:test_required).update_attributes(:quantity => 12)
		assert_equal 12, items(:test_required).quantity
	end	
	
	# Test Case I58: Change item condition
   
	# Precondition: Item already exists
	# Input: condition
	# Expected Output: Changed item condition
	# Actual Output: 
	
	test "I58" do
		items(:test_required).update_attributes(:condition => "like new")
		assert_equal "like new", items(:test_required).condition
	end	
	
	# Test Case I59: Change item length
   
	# Precondition: Item already exists
	# Input: length
	# Expected Output: Change item length
	# Actual Output: 
		
	test "I59" do
		items(:test_all).update_attributes(:length => 20)
		assert_equal 20, items(:test_all).length
	end	
	
	
	# Test Case I60: Change item width
   
	# Precondition: Item already exists
	# Input: width
	# Expected Output: Change item width
	# Actual Output: 
		
	test "I60" do
		items(:test_all).update_attributes(:width => 20)
		assert_equal 20, items(:test_all).width
	end	
	
	# Test Case I61: Change item height
   
	# Precondition: Item already exists
	# Input: height
	# Expected Output: Change item height
	# Actual Output: 
		
	test "I61" do
		items(:test_all).update_attributes(:height => 20)
		assert_equal 20, items(:test_all).height
	end	
	
	# Test Case I62: Change item price
   
	# Precondition: Item already exists
	# Input: price
	# Expected Output: Change item price
	# Actual Output: 
		
	test "I62" do
		items(:test_all).update_attributes(:price => 20)
		assert_equal 20, items(:test_all).price
	end		
	
	# Test Case I63: Change item available_from
   
	# Precondition: Item already exists
	# Input: available_from
	# Expected Output: Change item available_from
	# Actual Output: 
		
	test "I63" do
		items(:test_all).update_attributes(:available_from => 2013-04-24)
		assert_equal 2013-04-24, items(:test_all).available_from
	end		
		
	
	# Test Case I64: Change item available_until
   
	# Precondition: Item already exists
	# Input: available_until
	# Expected Output: Change item available_until
	# Actual Output: 	
		
	test "I64" do
		items(:test_all).update_attributes(:available_until => 2014-04-23)
		assert_equal 2014-04-23, items(:test_all).available_until
	end		
	
	# Test Case I65: Change item weight
   
	# Precondition: Item already exists
	# Input: weight
	# Expected Output: Change item weight
	# Actual Output: 
		
	test "I65" do
		items(:test_all).update_attributes(:weight => 20)
		assert_equal 20, items(:test_all).weight
	end		
		
	
	# Test Case I66: Change item name and category
   
	# Precondition: Item already exists
	# Input: name, category
	# Expected Output: Change item name and category
	# Actual Output: 
		
	test "I66" do
		items(:test_all).update_attributes(:weight => 20, :available_until => 2014-04-23, :available_from => 2013-04-24, :price => 20, :height => 20, :width => 20, :length => 20, :quantity => 12, :condition => "like new", :description => "changed it", :name => "Tony", :category => "appliances")
		assert_equal 20, items(:test_all).weight
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal 20, items(:test_all).price
		assert_equal 20, items(:test_all).height
		assert_equal 20, items(:test_all).width
		assert_equal 20, items(:test_all).length
		assert_equal 12, items(:test_all).quantity
		assert_equal "like new", items(:test_all).condition
		assert_equal "changed it", items(:test_all).description
		assert_equal "Tony", items(:test_all).name
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I67: Change item name and description
   
	# Precondition: Item already exists
	# Input: name, description
	# Expected Output: Change item name and description
	# Actual Output: 
		
	test "I67" do
		items(:test_all).update_attributes(:description => "changed it", :name => "Tony")
		assert_equal "changed it", items(:test_all).description
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I68: Change item name and image
   
	# Precondition: Item already exists
	# Input: name, image
	# Expected Output: Change item name and image
	# Actual Output: 
		
	test "I68" do
		items(:test_all).update_attributes(:name => "Tony")
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I69: Change item name and quantity
   
	# Precondition: Item already exists
	# Input: name, quantity
	# Expected Output: Change item name and quantity
	# Actual Output: 
		
	test "I69" do
		items(:test_all).update_attributes(:quantity => 12, :name => "Tony")
		assert_equal 12, items(:test_all).quantity
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I70: Change item name and condition
   
	# Precondition: Item already exists
	# Input: name, condition
	# Expected Output: Change item name and condition
	# Actual Output: 
		
	test "I70" do
		items(:test_all).update_attributes(:condition => "like new", :name => "Tony")
		assert_equal "like new", items(:test_all).condition
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I71: Change item name and length
   
	# Precondition: Item already exists
	# Input: name, length
	# Expected Output: Change item name and length
	# Actual Output: 
		
	test "I71" do
		items(:test_all).update_attributes(:length => 20, :name => "Tony")
		assert_equal 20, items(:test_all).length
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I72: Change item name and width
   
	# Precondition: Item already exists
	# Input: name, width
	# Expected Output: Change item name and width
	# Actual Output: 
		
	test "I72" do
		items(:test_all).update_attributes(:width => 20, :name => "Tony")
		assert_equal 20, items(:test_all).width
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I73: Change item name and height
   
	# Precondition: Item already exists
	# Input: name, height
	# Expected Output: Change item name and height
	# Actual Output: 
		
	test "I73" do
		items(:test_all).update_attributes(:height => 20, :name => "Tony")
		assert_equal 20, items(:test_all).height
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I74: Change item name and price
   
	# Precondition: Item already exists
	# Input: name, price
	# Expected Output: Change item name and price
	# Actual Output: 
		
	test "I74" do
		items(:test_all).update_attributes(:price => 20, :name => "Tony")
		assert_equal 20, items(:test_all).price
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I75: Change item name and available_from
   
	# Precondition: Item already exists
	# Input: name, available_from
	# Expected Output: Change item name and available_from
	# Actual Output: 
		
	test "I75" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :name => "Tony")
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I76: Change item name and available_until
   
	# Precondition: Item already exists
	# Input: name, available_until
	# Expected Output: Change item name and available_until
	# Actual Output: 
		
	test "I76" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :name => "Tony")
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I77: Change item name and weight
   
	# Precondition: Item already exists
	# Input: name, weight
	# Expected Output: Change item name and weight
	# Actual Output: 
		
	test "I77" do
		items(:test_all).update_attributes(:weight => 20, :name => "Tony")
		assert_equal 20, items(:test_all).weight
		assert_equal "Tony", items(:test_all).name
	end		
		
	
	# Test Case I78: Change item category and description
   
	# Precondition: Item already exists
	# Input: category, description
	# Expected Output: Change item category and description
	# Actual Output: 
		
	test "I78" do
		items(:test_all).update_attributes(:description => "changed it", :category => "appliances")
		assert_equal "changed it", items(:test_all).description
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I79: Change item category and image
   
	# Precondition: Item already exists
	# Input: category, image
	# Expected Output: Change item category and image
	# Actual Output: 
		
	test "I79" do
		items(:test_all).update_attributes(:category => "appliances")
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I80: Change item category and quantity
   
	# Precondition: Item already exists
	# Input: category, quantity
	# Expected Output: Change item category and quantity
	# Actual Output: 
		
	test "I80" do
		items(:test_all).update_attributes(:quantity => 12, :category => "appliances")
		assert_equal 12, items(:test_all).quantity
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I81: Change item category and condition
   
	# Precondition: Item already exists
	# Input: category, condition
	# Expected Output: Change item category and condition
	# Actual Output: 
		
	test "I81" do
		items(:test_all).update_attributes(:condition => "like new", :category => "appliances")
		assert_equal "like new", items(:test_all).condition
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I82: Change item category and length
   
	# Precondition: Item already exists
	# Input: category, length
	# Expected Output: Change item category and length
	# Actual Output: 
		
	test "I82" do
		items(:test_all).update_attributes(:length => 20, :category => "appliances")
		assert_equal 20, items(:test_all).length
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I83: Change item category and width
   
	# Precondition: Item already exists
	# Input: category, width
	# Expected Output: Change item category and width
	# Actual Output: 
		
	test "I83" do
		items(:test_all).update_attributes(:width => 20, :category => "appliances")
		assert_equal 20, items(:test_all).width
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I84: Change item category and height
   
	# Precondition: Item already exists
	# Input: category, height
	# Expected Output: Change item category and height
	# Actual Output: 
		
	test "I84" do
		items(:test_all).update_attributes(:height => 20, :category => "appliances")
		assert_equal 20, items(:test_all).height
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I85: Change item category and price
   
	# Precondition: Item already exists
	# Input: category, price
	# Expected Output: Change item category and price
	# Actual Output: 
		
	test "I85" do
		items(:test_all).update_attributes(:price => 20, :category => "appliances")
		assert_equal 20, items(:test_all).price
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I86: Change item description and image
   
	# Precondition: Item already exists
	# Input: description, image
	# Expected Output: Change item description and image
	# Actual Output: 
		
	test "I86" do
		items(:test_all).update_attributes(:description => "changed it")
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I87: Change item description and quantity
   
	# Precondition: Item already exists
	# Input: description, quantity
	# Expected Output: Change item description and quantity
	# Actual Output: 
		
	test "I87" do
		items(:test_all).update_attributes(:quantity => 12, :description => "changed it")
		assert_equal 12, items(:test_all).quantity
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I88: Change item description and condition
   
	# Precondition: Item already exists
	# Input: description, condition
	# Expected Output: Change item description and condition
	# Actual Output: 
		
	test "I88" do
		items(:test_all).update_attributes(:condition => "like new", :description => "changed it")
		assert_equal "like new", items(:test_all).condition
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I89: Change item description and length
   
	# Precondition: Item already exists
	# Input: description, length
	# Expected Output: Change item description and length
	# Actual Output: 
		
	test "I89" do
		items(:test_all).update_attributes(:length => 20, :description => "changed it")
		assert_equal 20, items(:test_all).length
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I90: Change item description and width
   
	# Precondition: Item already exists
	# Input: description, width
	# Expected Output: Change item description and width
	# Actual Output: 
		
	test "I90" do
		items(:test_all).update_attributes(:width => 20, :description => "changed it")
		assert_equal 20, items(:test_all).width
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I91: Change item description and height
   
	# Precondition: Item already exists
	# Input: description, height
	# Expected Output: Change item description and height
	# Actual Output: 
		
	test "I91" do
		items(:test_all).update_attributes(:height => 20, :description => "changed it")
		assert_equal 20, items(:test_all).height
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I92: Change item description and price
   
	# Precondition: Item already exists
	# Input: description, price
	# Expected Output: Change item description and price
	# Actual Output: 
		
	test "I92" do
		items(:test_all).update_attributes(:price => 20, :description => "changed it")
		assert_equal 20, items(:test_all).price
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I93: Change item description and available_from
   
	# Precondition: Item already exists
	# Input: description, available_from
	# Expected Output: Change item description and available_from
	# Actual Output: 
		
	test "I93" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :description => "changed it")
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I94: Change item description and available_until
   
	# Precondition: Item already exists
	# Input: description, available_until
	# Expected Output: Change item description and available_until
	# Actual Output: 
		
	test "I94" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :description => "changed it")
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal "changed it", items(:test_all).description
	end		
		
	
	# Test Case I95: Change all fields except for user id 
   
	# Precondition: Item already exists
	# Input: All fields except for user id
	# Expected Output: All fields except for user id should be changed
	# Actual Output: 
		
	test "I95" do
		items(:test_all).update_attributes(:weight => 20, :available_until => 2014-04-23, :available_from => 2013-04-24, :price => 20, :height => 20, :width => 20, :length => 20, :quantity => 12, :condition => "like new", :description => "changed it", :name => "Tony", :category => "appliances")
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 20, items(:test_all).weight
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal 20, items(:test_all).price
		assert_equal 20, items(:test_all).height
		assert_equal 20, items(:test_all).width
		assert_equal 20, items(:test_all).length
		assert_equal 12, items(:test_all).quantity
		assert_equal "like new", items(:test_all).condition
		assert_equal "changed it", items(:test_all).description
		assert_equal "Tony", items(:test_all).name
		assert_equal "appliances", items(:test_all).category
	end		
		
	
	# Test Case I96: Change user id
   
	# Precondition: Item already exists
	# Input: User id
	# Expected Output: Item not updated
	# Actual Output: 
		
	test "I96" do
		assert_raise(ActiveModel::MassAssignmentSecurity::Error) {(items(:test_all).update_attributes(:user => "notification_user3"))}
	end		
		
	
	# Test Case I97: Change available_from to before todays date
   
	# Precondition: Item already exists
	# Input: Available from
	# Expected Output: Item not updated
	# Actual Output: 
		
	test "I97" do
		items(:test_all).update_attributes(:available_from => "2013-03-24")
		assert_equal Date.parse("2013-05-24"), items(:test_all).available_from
	end		
		
	
	# Test Case I98: Change available_until to before todays date
   
	# Precondition: Item already exists
	# Input: Available until
	# Expected Output: Item not updated
	# Actual Output: 
		
	test "I98" do
		items(:test_all).update_attributes(:available_until => "2014-03-23")
		assert_equal Date.parse("2014-05-23"), items(:test_all).available_until
	end		
		
	
	# Test Case I99: Change available_from to after available_until
   
	# Precondition: Item already exists
	# Input: Available_from
	# Expected Output: Item not updated
	# Actual Output: 
		
	test "I99" do
		items(:test_all).update_attributes(:available_from => "2013-06-24")
		assert_equal Date.parse("2013-05-24"), items(:test_all).available_from
	end		
		
	
	# Test Case I100: Change item image and quantity
   
	# Precondition: Item already exists
	# Input: image, quantity
	# Expected Output: Change item image and quantity
	# Actual Output: 
		
	test "I100" do
		items(:test_all).update_attributes(:quantity => 12)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 12, items(:test_all).quantity
	end		
		
	
	# Test Case I101: Change item image and condition
   
	# Precondition: Item already exists
	# Input: image, condition
	# Expected Output: Change item image and condition
	# Actual Output: 
		
	test "I101" do
		items(:test_all).update_attributes(:condition => "like new")
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I102: Change item image and length
   
	# Precondition: Item already exists
	# Input: image, length
	# Expected Output: Change item image and length
	# Actual Output: 
		
	test "I102" do
		items(:test_all).update_attributes(:length => 20)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 20, items(:test_all).length
	end		
	
	
	# Test Case I103: Change item image and width
   
	# Precondition: Item already exists
	# Input: image, width
	# Expected Output: Change item image and width
	# Actual Output: 
		
	test "I103" do
		items(:test_all).update_attributes(:width => 20)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 20, items(:test_all).width
	end		
	
	
	# Test Case I104: Change item image and height
   
	# Precondition: Item already exists
	# Input: image, height
	# Expected Output: Change item image and height
	# Actual Output: 
		
	test "I104" do
		items(:test_all).update_attributes(:height => 20)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 20, items(:test_all).height
	end		
	
	
	# Test Case I105: Change item image and price
   
	# Precondition: Item already exists
	# Input: image, price
	# Expected Output: Change item image and price
	# Actual Output: 
		
	test "I105" do
		items(:test_all).update_attributes(:price => 20)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 20, items(:test_all).price
	end		
	
	
	# Test Case I106: Change item image and available_from
   
	# Precondition: Item already exists
	# Input: image, available_from
	# Expected Output: Change item image and available_from
	# Actual Output: 
		
	test "I106" do
		items(:test_all).update_attributes(:available_from => 2013-04-24)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 2013-04-24, items(:test_all).available_from
	end		
	
	
	# Test Case I107: Change item image and available_until
   
	# Precondition: Item already exists
	# Input: image, available_until
	# Expected Output: Change item image and available_until
	# Actual Output: 
		
	test "I107" do
		items(:test_all).update_attributes(:available_until => 2014-04-23)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 2014-04-23, items(:test_all).available_until
		end		
	
	
	# Test Case I108: Change item image and weight
   
	# Precondition: Item already exists
	# Input: image, weight
	# Expected Output: Change item image and weight
	# Actual Output: 
		
	test "I108" do
		items(:test_all).update_attributes(:weight => 20)
		items(:test_all).image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
		assert_equal 20, items(:test_all).weight
	end		
	
	
	# Test Case I109: Change item quantity and condition
   
	# Precondition: Item already exists
	# Input: quantity, condition
	# Expected Output: Change item quantity and condition
	# Actual Output: 
		
	test "I109" do
		items(:test_all).update_attributes(:quantity => 12, :condition => "like new")
		assert_equal 12, items(:test_all).quantity
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I110: Change item quantity and length
   
	# Precondition: Item already exists
	# Input: quantity, length
	# Expected Output: Change item quantity and length
	# Actual Output: 
		
	test "I110" do
		items(:test_all).update_attributes(:length => 20, :quantity => 12)
		assert_equal 20, items(:test_all).length
		assert_equal 12, items(:test_all).quantity
	end		
	
	
	# Test Case I111: Change item quantity and width
   
	# Precondition: Item already exists
	# Input: quantity, width
	# Expected Output: Change item quantity and width
	# Actual Output: 
		
	test "I111" do
		items(:test_all).update_attributes(:width => 20, :quantity => 12)
		assert_equal 20, items(:test_all).width
		assert_equal 12, items(:test_all).quantity
	end		
	
	
	# Test Case I112: Change item quantity and height
   
	# Precondition: Item already exists
	# Input: quantity, height
	# Expected Output: Change item quantity and height
	# Actual Output: 
		
	test "I112" do
		items(:test_all).update_attributes(:height => 20, :quantity => 12)
		assert_equal 20, items(:test_all).height
		assert_equal 12, items(:test_all).quantity
	end		
	
	
	# Test Case I113: Change item quantity and price
   
	# Precondition: Item already exists
	# Input: quantity, price
	# Expected Output: Change item quantity and price
	# Actual Output: 
		
	test "I113" do
		items(:test_all).update_attributes(:price => 20, :quantity => 12)
		assert_equal 20, items(:test_all).price
		assert_equal 12, items(:test_all).quantity
	end		
	
	
	# Test Case I114: Change item quantity and avilable_from
   
	# Precondition: Item already exists
	# Input: quantity, available_from
	# Expected Output: Change item quantity and available_from
	# Actual Output: 
		
	test "I114" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :quantity => 12)
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal 12, items(:test_all).quantity
	end		
	
	
	# Test Case I115: Change item quantity and available_until
   
	# Precondition: Item already exists
	# Input: quantity, available_until
	# Expected Output: Change item quantity and available_until 
	# Actual Output: 
		
	test "I115" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :quantity => 12)
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 12, items(:test_all).quantity
	end		
	
	
	# Test Case I116: Change item quantity and price
   
	# Precondition: Item already exists
	# Input: quantity, price
	# Expected Output: Change item quantity and price
	# Actual Output: 
		
	test "I116" do
		items(:test_all).update_attributes(:price => 20, :quantity => 12)
		assert_equal 20, items(:test_all).price
		assert_equal 12, items(:test_all).quantity
	end		
	
	
	# Test Case I117: Change item condition and length
   
	# Precondition: Item already exists
	# Input: condition, length
	# Expected Output: Change item condition and length
	# Actual Output: 
		
	test "I117" do
		items(:test_all).update_attributes(:length => 20, :condition => "like new")
		assert_equal 20, items(:test_all).length
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I118: Change item condition and width
   
	# Precondition: Item already exists
	# Input: condition, width
	# Expected Output: Change item condition and width
	# Actual Output: 
		
	test "I118" do
		items(:test_all).update_attributes(:width => 20, :condition => "like new")
		assert_equal 20, items(:test_all).width
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I119: Change item condition and height
   
	# Precondition: Item already exists
	# Input: condition, height
	# Expected Output: Change item condition and height
	# Actual Output: 
		
	test "I119" do
		items(:test_all).update_attributes(:height => 20, :condition => "like new")
		assert_equal 20, items(:test_all).height
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I120: Change item condition and price
   
	# Precondition: Item already exists
	# Input: condition, price
	# Expected Output: Change item condition and price
	# Actual Output: 
		
	test "I120" do
		items(:test_all).update_attributes(:price => 20, :condition => "like new")
		assert_equal 20, items(:test_all).price
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I121: Change item condition and available_from
   
	# Precondition: Item already exists
	# Input: condition, available_from
	# Expected Output: Change item condition and available_from
	# Actual Output: 
		
	test "I121" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :condition => "like new")
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I122: Change item condition and available_until
   
	# Precondition: Item already exists
	# Input: condition, available_until
	# Expected Output: Change item condition and available_until
	# Actual Output: 
		
	test "I122" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :condition => "like new")
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I123: Change item condition and weight
   
	# Precondition: Item already exists
	# Input: condition, weight
	# Expected Output: Change item condition and weight
	# Actual Output: 
		
	test "I123" do
		items(:test_all).update_attributes(:weight => 20, :condition => "like new")
		assert_equal 20, items(:test_all).weight
		assert_equal "like new", items(:test_all).condition
	end		
	
	
	# Test Case I124: Change item length and width
   
	# Precondition: Item already exists
	# Input: length, width
	# Expected Output: Change item length and width
	# Actual Output: 
		
	test "I124" do
		items(:test_all).update_attributes(:width => 20, :length => 20)
		assert_equal 20, items(:test_all).width
		assert_equal 20, items(:test_all).length
	end		
	
	
	# Test Case I125: Change item length and height
   
	# Precondition: Item already exists
	# Input: length, height
	# Expected Output: Change item length and height
	# Actual Output: 
		
	test "I125" do
		items(:test_all).update_attributes(:height => 20, :length => 20)
		assert_equal 20, items(:test_all).height
		assert_equal 20, items(:test_all).length
	end		
	
	
	# Test Case I126: Change item length and price
   
	# Precondition: Item already exists
	# Input: length, price
	# Expected Output: Change item length and price
	# Actual Output: 
		
	test "I126" do
		items(:test_all).update_attributes(:price => 20, :length => 20)
		assert_equal 20, items(:test_all).price
		assert_equal 20, items(:test_all).length
	end		
	
	
	# Test Case I127: Change item length and available_from
   
	# Precondition: Item already exists
	# Input: length, available_from
	# Expected Output: Change item length and available_from
	# Actual Output: 
		
	test "I127" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :length => 20)
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal 20, items(:test_all).length
	end		
	
	
	# Test Case I128: Change item length and available_until
   
	# Precondition: Item already exists
	# Input: length, available_until
	# Expected Output: Change item length and available_until
	# Actual Output: 
		
	test "I128" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :length => 20)
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 20, items(:test_all).length
	end		
	
	
	# Test Case I129: Change item length and weight
   
	# Precondition: Item already exists
	# Input: length, weight
	# Expected Output: Change item length and weight
	# Actual Output: 
		
	test "I129" do
		items(:test_all).update_attributes(:weight => 20, :length => 20)
		assert_equal 20, items(:test_all).weight
		assert_equal 20, items(:test_all).length
	end		
	
	
	# Test Case I130: Change item width and height
   
	# Precondition: Item already exists
	# Input: width, height
	# Expected Output: Change item width and height
	# Actual Output: 
		
	test "I130" do
		items(:test_all).update_attributes(:height => 20, :width => 20)
		assert_equal 20, items(:test_all).height
		assert_equal 20, items(:test_all).width
	end		
	
	
	# Test Case I131: Change item width and price
   
	# Precondition: Item already exists
	# Input: width, price
	# Expected Output: Change item width and price
	# Actual Output: 
		
	test "I131" do
		items(:test_all).update_attributes(:price => 20, :width => 20)
		assert_equal 20, items(:test_all).price
		assert_equal 20, items(:test_all).width
	end		
	
	
	# Test Case I132: Change item width and available_from
   
	# Precondition: Item already exists
	# Input: width, available_from
	# Expected Output: Change item width and available_from
	# Actual Output: 
		
	test "I132" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :width => 20)
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal 20, items(:test_all).width
	end		
	
	
	# Test Case I133: Change item width and available_until
   
	# Precondition: Item already exists
	# Input: width, available_until
	# Expected Output: Change item width and available_until
	# Actual Output: 
		
	test "I133" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :width => 20)
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 20, items(:test_all).width
	end		
	
	
	# Test Case I134: Change item width and weight
   
	# Precondition: Item already exists
	# Input: width, weight
	# Expected Output: Change item width and weight
	# Actual Output: 
		
	test "I134" do
		items(:test_all).update_attributes(:height => 20, :width => 20)
		assert_equal 20, items(:test_all).height
		assert_equal 20, items(:test_all).width
	end		
	
	
	# Test Case I135: Change item height and price
   
	# Precondition: Item already exists
	# Input: height, price
	# Expected Output: Change item height and price
	# Actual Output: 
		
	test "I135" do
		items(:test_all).update_attributes(:price => 20, :height => 20)
		assert_equal 20, items(:test_all).price
		assert_equal 20, items(:test_all).height
	end		
	
	
	# Test Case I136: Change item height and available_from
   
	# Precondition: Item already exists
	# Input: height, available_form
	# Expected Output: Change item height and available_from
	# Actual Output: 
		
	test "I136" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :height => 20)
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal 20, items(:test_all).height
	end		
	
	
	# Test Case I137: Change item height and available_until
   
	# Precondition: Item already exists
	# Input: height, available_until
	# Expected Output: Change item height and available_until
	# Actual Output: 
		
	test "I137" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :height => 20)
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 20, items(:test_all).height
	end		
	
	
	# Test Case I138: Change item height and weight
   
	# Precondition: Item already exists
	# Input: height, weight
	# Expected Output: Change item height and weight
	# Actual Output: 
		
	test "I138" do
		items(:test_all).update_attributes(:weight => 20, :height => 20)
		assert_equal 20, items(:test_all).weight
		assert_equal 20, items(:test_all).height
	end		
	
	
	# Test Case I139: Change item price and available_from
   
	# Precondition: Item already exists
	# Input: price, available_from
	# Expected Output: Change item price and available_from
	# Actual Output: 
		
	test "I139" do
		items(:test_all).update_attributes(:available_from => 2013-04-24, :price => 20)
		assert_equal 2013-04-24, items(:test_all).available_from
		assert_equal 20, items(:test_all).price
	end		
	
	
	# Test Case I140: Change item price and available_until
   
	# Precondition: Item already exists
	# Input: price, available_until
	# Expected Output: Change item price and available_until
	# Actual Output: 
		
	test "I140" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :price => 20)
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 20, items(:test_all).price
	end		
	
	
	# Test Case I141: Change item price and weight
   
	# Precondition: Item already exists
	# Input: price, weight
	# Expected Output: Change item price and weight
	# Actual Output: 
		
	test "I141" do
		items(:test_all).update_attributes(:weight => 20, :price => 20)
		assert_equal 20, items(:test_all).weight
		assert_equal 20, items(:test_all).price
	end		
	
	
	# Test Case I142: Change item available_from and weight
   
	# Precondition: Item already exists
	# Input: available_from, weight
	# Expected Output: Change item available_from and weight
	# Actual Output: 
		
	test "I142" do
		items(:test_all).update_attributes(:weight => 20, :available_from => 2013-04-24)
		assert_equal 20, items(:test_all).weight
		assert_equal 2013-04-24, items(:test_all).available_from
	end		
	
	
	# Test Case I146: Change item image
   
	# Precondition: Item already exists
	# Input: image
	# Expected Output: Change item image
	# Actual Output: 
		
	test "I146" do
        item = items(:test_all)
		item.image = open("#{Rails.root}/app/assets/images/items/nails.jpg")
		assert items(:test_all).image.to_s.include? ("nails.jpg")
	end		
	
	
	# Test Case I143: Change item available_until and weight
   
	# Precondition: Item already exists
	# Input: available_until, weight
	# Expected Output: Change item available_until and weight
	# Actual Output: 
		
	test "I143" do
		items(:test_all).update_attributes(:weight => 20, :available_until => 2014-04-23)
		assert_equal 20, items(:test_all).weight
		assert_equal 2014-04-23, items(:test_all).available_until
	end		
	
	
	# Test Case I147: Change available_from and available_until for appropriate dates
   
	# Precondition: Item already exists
	# Input: available_from, available_until
	# Expected Output: Change available_from and available_until
	# Actual Output: 
		
	test "I147" do
		items(:test_all).update_attributes(:available_until => 2014-04-23, :available_from => 2013-04-24)
		assert_equal 2014-04-23, items(:test_all).available_until
		assert_equal 2013-04-24, items(:test_all).available_from
	end		
	
	# Test Case I148: Change item available_until to before available_from 
   
	# Precondition: Item already exists
	# Input: available_until
	# Expected Output: Change item available_until to before available_from 
	# Actual Output: 
		
	test "I148" do
		items(:test_all).update_attributes(:available_until => 2014-04-23)
		assert_equal 2014-04-23, items(:test_all).available_until
	end		
	
	#-------------- End Modify Item ---------------------
	#-------------- Begin Delete Item -----------------
	
	# Test Case I144: Deleting item when item exists by ID
   
	# Precondition: Item already exists
	# Input: ID
	# Expected Output: item is deleted
	# Actual Output: 
		
	test "I144" do
                id = items(:test_all).id
		items(:test_all).destroy
	        assert_raise(ActiveRecord::RecordNotFound) { Item.find(id) }
	end		
	
	
	# Test Case I145: Deleting item where item doesn't exist
   
	# Precondition: Item doesn't exists
	# Input: ID
	# Expected Output: NULL
	# Actual Output: 
		
	test "I145" do
		assert_raise(ActiveRecord::RecordNotFound) {(Item.find(:"000"))} # Destroy function works on finding the item first
		assert_raise(StandardError) {(items(:test_all_bleh).destroy)}
	end		
	

	#-------------- End Delete Item -------------------
	
	#----------Template----------
	
	# Test Case I14: 
   
	# Precondition: 
	# Input: 
	# Expected Output: 
	# Actual Output: 

	


	
end
