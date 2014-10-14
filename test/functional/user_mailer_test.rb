require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  tests UserMailer


  test "reg_confirmation" do
    user = users(:search_user1)

    sent = UserMailer.reg_confirmation(user)

    assert_equal "Registered", sent.subject
    assert_equal [user.email], sent.to

  end

  test "pwd_reminder" do
    user = users(:search_user1)
     user.update_attribute(:password_reset_token, 1)
    sent = UserMailer.password_reset(user)

     assert_equal [user.email], sent.to
    assert_equal "Password Reset", sent.subject
    
  end

  test "contact user" do
    user = users(:search_user1)
    msg = Message.new(:name => 'msg_name', :content=> 'be my friend',:email => 'test@g.com' )
    sent = UserMailer.contact_user(user,msg)
 
     assert_equal [user.email], sent.to
     assert_equal  msg.name, sent.subject
     assert_equal  [msg.email], sent.reply_to
     assert_equal  msg.content, sent.body.to_s
 
  end

 test "notify flag" do
    user = users(:search_user1)
    flag = Flag.new()
    flag.user_id = User.first.id
    flag.reason = "Reason"
    flag.comment = "Comment"
    flag.flaggable_id = Item.first.id
    flag.flaggable_type = "Item"
    sent = UserMailer.notify_flag(user,flag)
 
    assert_equal [user.email], sent.to
    assert_equal "Flag Submitted", sent.subject
    
  end




end
