require 'test_helper'

class ThreeComponentTest < ActionDispatch::IntegrationTest
   fixtures :all
   pass = "123456"
   email = "email@host.org"
   name = "bubba"

# ---------------  User, Flag and Item ----------------------
  # Test Case UFI00: user can flag an item
   test "user flag item" do
        user = create_account  
        sign_in
        
        item = items(:search_test4)
        curr_size = Flag.count

        get ('/items/' + item.id.to_s + '/flags/new')
        assert :success
       
        post_via_redirect ('/items/' + item.id.to_s + '/flags' ), flag:{ reason:'myReason', comment: 'MyComment'}
        assert_equal 'Report was successfully submitted.', flash[:notice]

        
        assert_equal(Flag.count,(curr_size +1))
        assert_not_equal [],Flag.where('flaggable_id = ?',item.id)
   end

# ---------------  User, Flag and Project ----------------------
  # Test Case UFP00: user can flag a project
   test "user flag project" do
        user = create_account  
        sign_in
        
        proj = projects(:project_test2)
        curr_size = Flag.count

        get ('/projects/' + proj.id.to_s + '/flags/new')
        assert :success
       
        post_via_redirect ('/projects/' + proj.id.to_s + '/flags' ), flag:{ reason:'MyReason', comment: 'MyComment'}
        assert_equal 'Report was successfully submitted.', flash[:notice]

        
        assert_equal(Flag.count,(curr_size +1))
        assert_not_equal [],Flag.where('flaggable_id = ? AND reason = ?',proj.id,'MyReason')
   end
  
# ---------------  User, Flag and Event ----------------------
  # Test Case UFE00: user can flag an Event
   test "user flag event" do
        user = create_account  
        sign_in
        
        event = events(:test_event1)
        curr_size = Flag.count

        get ('/events/' + event.id.to_s + '/flags/new')
        assert :success
       
        post_via_redirect ('/events/' + event.id.to_s + '/flags' ), flag:{ reason:'eventReason', comment: 'eventComment'}
        assert_equal 'Report was successfully submitted.', flash[:notice]

        
        assert_equal(Flag.count,(curr_size +1))
        assert_not_equal [],Flag.where('flaggable_id = ? AND comment = ?',event.id,'eventComment')
   end

# ---------------  User, Item and Message ----------------------
  # Test Case IUM00: user can be send a mseesage from an item to another user 
   test "item user message" do
        create_account  
        sign_in
        
        item = items(:search_test4)

        get ('/items/' + item.id.to_s )
        assert :success
 
        user = User.find(item.user_id)   
        get ('/users/' + user.id.to_s + '/messages/new')   
       
        post_via_redirect ('/users/' + user.id.to_s + '/messages' ), message:{ name:name, email: email, content: 'You man, sick item!'}
        assert :success
        assert_equal "Message sent!", flash[:notice]

        
        
   end



private
  def create_account
    pass = "123456"
    email = "email@host.org"
    name = "bubba"
    user = User.new(:email =>email, :password => pass,:password_confirmation =>pass, :name =>name)
    user.confirmed = true
    user.save

  end

  def sign_in
    pass = "123456"
    email = "email@host.org"
    get "/signin"
    assert_response :success
    post_via_redirect "/sessions", :session =>{:email =>email, :password => pass}

  end
end
