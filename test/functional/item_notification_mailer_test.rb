require 'test_helper'

class ItemNotificationMailerTest < ActionMailer::TestCase
  tests ItemNotificationMailer


  test "alert_user" do
    item = items(:search_test1)
    wish = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "1", :height => "1", :weight => "1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
    wish.user_id = User.first.id
    sent = ItemNotificationMailer.alert_user(item,wish)

    user = User.find(item.user_id)
    assert_equal "New Notifications for your Wish List", sent.subject
    assert_equal [user.email], sent.to

  end

  test "alert user item array " do
    item = items(:search_test1)
    wish = WishList.new(:name => "Name", :description => "description", :category => "category", :condition => "condition", :location => "location", :length => "1", :width => "1", :height => "1", :weight => "1", :price => "1", :available_until => "2020-03-16 20:08:41", :quantity => "1")
    wish.user_id = User.first.id
    sent = ItemNotificationMailer.alert_user(item,wish)
     
    user = User.find(item.user_id)
     assert_equal [user.email], sent.to
    assert_equal "New Notifications for your Wish List", sent.subject
    
  end



end
