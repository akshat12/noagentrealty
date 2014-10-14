require 'test_helper'

class WishListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # Test to see that an empty wish list cannot be created
   test "should not save wish list with empty fields" do
   	wishlist = WishList.new
   	assert !wishlist.save, "Saved wish list with empty fields"
   end
  
  # Test to see that a wish list cannot be created with just a name
  test "should not save wish list with name only" do
    wishlist = WishList.new(:name => "Name")
    assert !wishlist.save, "Saved wish list with just a name"
  end
  
  # Test to see that a wish list cannot be created with just a description
  test "should not save wish list with description only" do
    wishlist = WishList.new(:description => "Description")
    assert !wishlist.save, "Saved wish list with just a description"
  end
  
  # Test to see that a wish list cannot be created with just a category
  test "should not save wish list with category only" do
    wishlist = WishList.new(:category => "category")
    assert !wishlist.save, "Saved wish list with just a category"
  end
  
  # Test to see that a wish list cannot be created with just a condition
  test "should not save wish list with condition only" do
    wishlist = WishList.new(:condition => "condition")
    assert !wishlist.save, "Saved wish list with just a condtion"
  end
  
  # Test to see that a wish list cannot be created with just a location
  test "should not save wish list with location only" do
    wishlist = WishList.new(:location => "location")
    assert !wishlist.save, "Saved wish list with just a location"
  end
  
  # Test to see that a wish list cannot be created with just a quantity
  test "should not save wish list with quantity only" do
    wishlist = WishList.new(:quantity => "1")
    assert !wishlist.save, "Saved wish list with just a quantity"
  end
  # Test to see that a wish list cannot be created with just a length
  test "should not save wish list with length only" do
    wishlist = WishList.new(:length => "1")
    assert !wishlist.save, "Saved wish list with just a length"
  end
  
  # Test to see that a wish list cannot be created with just a width
  test "should not save wish list with width only" do
    wishlist = WishList.new(:width => "1")
    assert !wishlist.save, "Saved wish list with just a width"
  end
  
  # Test to see that a wish list cannot be created with just a height
  test "should not save wish list with height only" do
    wishlist = WishList.new(:height => "1")
    assert !wishlist.save, "Saved wish list with just a height"
  end
  
  # Test to see that a wish list cannot be created with just a weight
  test "should not save wish list with weight only" do
    wishlist = WishList.new(:weight => "1")
    assert !wishlist.save, "Saved wish list with just a weight"
  end
  
  # Test to see that a wish list cannot be created with just a price
  test "should not save wish list with price only" do
    wishlist = WishList.new(:price => "1")
    assert !wishlist.save, "Saved wish list with just a price"
  end  
  
  # Test to see that a wish list cannot be created with just a date available until
  test "should not save wish list with available until only" do
    wishlist = WishList.new(:available_until => "2020-03-14 20:08:41")
    assert !wishlist.save, "Saved wish list with just a date available until"
  end
  
  #Test that a wish list cannot be created with a negative quantity
  test "should not save wish list with negative quantity" do
    wishlist = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "1", :height => "1", :weight => "1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "-1")
     assert !wishlist.save, "Saved wish list with a negative quantity"
  end
  
  #Test that a wish list cannot be created with a negative length
  test "should not save wish list with negative length" do
    wishlist = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "-1", :width => "1", :height => "1", :weight => "1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
     assert !wishlist.save, "Saved wish list with a negative length"
  end
  
  #Test that a wish list cannot be created with a negative width
  test "should not save wish list with negative width" do
    wishlist = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "-1", :height => "1", :weight => "1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
     assert !wishlist.save, "Saved wish list with a negative width"
  end
  
  #Test that a wish list cannot be created with a negative height
  test "should not save wish list with negative height" do
    wishlist = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "1", :height => "-1", :weight => "1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
     assert !wishlist.save, "Saved wish list with a negative length"
  end
  
  #Test that a wish list cannot be created with a negative weight
  test "should not save wish list with negative weight" do
    wishlist = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "1", :height => "1", :weight => "-1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
     assert !wishlist.save, "Saved wish list with a negative weight"
  end
  
  #Test that a wish list cannot be created with a negative price
  test "should not save wish list with negative price" do
    wishlist = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "1", :height => "1", :weight => "1", :price => "-1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
     assert !wishlist.save, "Saved wish list with a negative price"
  end
  
  #Test that a wish list can be created with all fields filled in correctly
  test "save wish list with all fields correct" do
    wishlist = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "1", :height => "1", :weight => "1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
    wishlist.user_id = User.first.id
     assert wishlist.save, "Saved wish list with all correct fields"
  end
  
  
  
end
