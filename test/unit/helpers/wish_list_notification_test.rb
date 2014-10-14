require 'test_helper'

class WishListNotificationTest < ActionView::TestCase
  include WishListNotificationHelper
  
# Test plan: Create a test for each individual methods. Check to see that the proper arrays are returned.

# Test1: search_wishlist(item) test.
# Check to see that no wish list matched 

  test "no wish list and item match" do
      @item = items(:notifications_item_test1)
      @emptyList = search_wishlist(@item)
      assert_equal @emptyList.size, 0, "ERROR: The wish list was not empty"
  end

# Test2: Check for one wish list match

  test "one wish list match" do
    @item2 = items(:notifications_item_test2)
    @oneListMatch = search_wishlist(@item2)
    assert_equal @oneListMatch.size, 1, "ERROR: More than one match was found"
    assert_equal @oneListMatch[0].name, @item2.name, "ERROR: Names do not match"
  end

# Test 3: Check for two wish list matches
  test "two wish list matches" do
    @item3 = items(:notifications_item_test3)
    @twoListMatch = search_wishlist(@item3)
    assert_equal @twoListMatch.size, 2, "ERROR: More or less than 2 matches were found"
  end

# Test 4: Create a new item and check for wish list match
end
