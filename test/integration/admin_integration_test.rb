require 'test_helper'

class AdminIntegrationTest < ActionDispatch::IntegrationTest
   fixtures :all
   pass = "123456"
   email = "email@admin.org"
   name = "bubba"

# --------------- Admin and Events ----------------------

   # Test Case AE00: admin can delete events
   test "admin delete event" do
        user = create_admin  
        sign_in
        
        event = events(:test_event1)
        curr_size = Event.count
       
        delete_via_redirect ('/events/'+event.id.to_s)
        assert_response :success   
        
        assert_equal(Event.count,(curr_size -1))
        assert_equal [], Event.where("id = ?",event.id)

   end

  # Test Case AE01: admin can create events
  test "admin create event" do
        user = create_admin  
        sign_in
        
        curr_size = Event.count
        get '/events/new'


        post_via_redirect '/events', event:{ name:'test event',description: 'admin party', event_date: Date.today, start_time: '12:00:00',end_time: Time.at(0), location_attributes:{address: "pub"}}
        assert_response :success   
        assert_equal 'Event was successfully created.', flash[:notice]

        assert_equal(curr_size +1, Event.count)
        event = Event.where("name = ?",'test event')
        assert_equal event.first.description,'admin party'

   end

# --------------- Admin and Items ----------------------
# Test Case AI00: admin can delete items
   test "admin delete item" do
        user = create_admin  
        sign_in
        
        item = items(:search_test1)
        curr_size = Item.count
       
        delete_via_redirect ('/items/'+item.id.to_s)
        
        assert_equal(Item.count,(curr_size -1))
        assert_equal [], Item.where("id = ?",item.id)

   end

# --------------- Admin and News ----------------------
# Test Case AN00: admin can delete news
   test "admin delete news" do
        user = create_admin  
        sign_in
        
        myNews = news(:news_test1)
        curr_size = News.count
       
        delete_via_redirect ('/news/'+myNews.id.to_s)
        assert_response :success   
        
        assert_equal(News.count,(curr_size -1))
        assert_equal [], News.where("id = ?",myNews.id)

   end

# --------------- Admin and Projects ----------------------
# Test Case AP00: admin can delete projects
   test "admin delete projects" do
        user = create_admin  
        sign_in
        
        proj = projects(:project_test1)
        curr_size = Project.count
       
        delete_via_redirect ('/projects/'+proj.id.to_s)
        assert_response :success   
        
        assert_equal(Project.count,(curr_size -1))
        assert_equal [], Project.where("id = ?",proj.id)

   end

# --------------- Admin and Statistics ----------------------
# Test Case AS00: admin can download statistics
test "admin download statistics" do
        admin = create_admin  
        sign_in
        
        get '/items.csv'
        assert_response :success   
        
        get '/items.xls'
        assert_response :success

   end


# --------------- Admin and Users----------------------
# Test Case AP00: admin can delete users
   test "admin delete users" do
        admin = create_admin  
        sign_in
        
        user = users(:notification_user2)
        curr_size = User.count
       
        delete_via_redirect ('/users/'+user.id.to_s)
        assert_response :success   
        
        assert_equal(User.count,(curr_size -1))
        assert_equal [], User.where("id = ?",user.id)

   end

# --------------- Admin, Flag and User----------------------
# Test Case AFU00: admin can delete flags from a user
   test "admin delete user flags" do
        admin = create_admin  
        sign_in
        
        user = users(:notification_user1)
        flag = Flag.where('flaggable_id = ?',user.id)
        assert_not_equal [], flag

        curr_size = Flag.count
        delete_via_redirect ('/users/'+user.id.to_s+'/flags/'+flag.first.id.to_s)
        assert_equal 'Flag deleted', flash[:notice]

        assert_equal((curr_size -1),Flag.count)
        assert_equal [], Flag.where("id = ?",flag.first.id)

   end

# Test Case AFU01: admin can delete a user with flags
   test "admin delete user with flags" do
        admin = create_admin  
        sign_in
        
        user = users(:notification_user1)
        flag = Flag.where('flaggable_id = ?',user.id)
        assert_not_equal [], flag

        curr_size = User.count
        delete_via_redirect ('/users/'+user.id.to_s)

        
        assert_equal(User.count,(curr_size -1))
        assert_equal [], User.where("id = ?",user.id)

   end

# --------------- Admin, Flag and Event----------------------
# Test Case AFE00: admin can delete flags from a event
   test "admin delete event flags" do
        admin = create_admin  
        sign_in
        
        event = events(:test_event2)
        flag = Flag.where('flaggable_id = ?',event.id)
        assert_not_equal [], flag

        curr_size = Flag.count
        delete_via_redirect ('/events/'+event.id.to_s+'/flags/'+flag.first.id.to_s)
        assert_equal 'Flag deleted', flash[:notice]

        assert_equal((curr_size -1),Flag.count)
        assert_equal [], Flag.where("id = ?",flag.first.id)

   end

# Test Case AFE01: admin can delete an event with flags
   test "admin delete event with flags" do
        admin = create_admin  
        sign_in
        
        event = events(:test_event2)
        flag = Flag.where('flaggable_id = ?',event.id)
        assert_not_equal [], flag

        curr_size = Event.count
        delete_via_redirect ('/events/'+event.id.to_s)

        
        assert_equal(Event.count,(curr_size -1))
        assert_equal [], Event.where("id = ?",event.id)

   end

# --------------- Admin, Flag and Item----------------------
# Test Case AFI00: admin can delete flags from an item
   test "admin delete item flags" do
        admin = create_admin  
        sign_in
        
        item = items(:search_test2)
        flag = Flag.where('flaggable_id = ?',item.id)
        assert_not_equal [], flag

        curr_size = Flag.count
        delete_via_redirect ('/items/'+item.id.to_s+'/flags/'+flag.first.id.to_s)
        assert_equal 'Flag deleted', flash[:notice]

        assert_equal((curr_size -1),Flag.count)
        assert_equal [], Flag.where("id = ?",flag.first.id)

   end

# Test Case AFI01: admin can delete an item with flags
   test "admin delete item with flags" do
        admin = create_admin  
        sign_in
        
        item = items(:search_test2)
        flag = Flag.where('flaggable_id = ?',item.id)
        assert_not_equal [], flag

        curr_size = Item.count
        delete_via_redirect ('/items/'+item.id.to_s)

        
        assert_equal(Item.count,(curr_size -1))
        assert_equal [], Item.where("id = ?",item.id)

   end

# --------------- Admin, Flag and Project----------------------
# Test Case AFJ00: admin can delete flags from a project
   test "admin delete project flags" do
        admin = create_admin  
        sign_in
        
        proj = projects(:project_test2)
        flag = Flag.where('flaggable_id = ?',proj.id)
        assert_not_equal [], flag

        curr_size = Flag.count
        delete_via_redirect ('/projects/'+proj.id.to_s+'/flags/'+flag.first.id.to_s)
        assert_equal 'Flag deleted', flash[:notice]

        assert_equal((curr_size -1),Flag.count)
        assert_equal [], Flag.where("id = ?",proj.id)

   end

# Test Case AFE01: admin can delete a project with flags
   test "admin delete project with flags" do
        admin = create_admin  
        sign_in
        
        proj = projects(:project_test2)
        flag = Flag.where('flaggable_id = ?',proj.id)
        assert_not_equal [], flag

        curr_size = Project.count
        delete_via_redirect ('/projects/'+proj.id.to_s)

        
        assert_equal(Project.count,(curr_size -1))
        assert_equal [], Project.where("id = ?",proj.id)

   end


private
  def create_admin
    pass = "123456"
    email = "email@admin.org"
    name = "bubba"
    user = User.new(:email =>email, :password => pass,:password_confirmation =>pass, :name =>name)
    user.admin = true
    user.confirmed = true
    user.save

  end

  def sign_in
    pass = "123456"
    email = "email@admin.org"
    get "/signin"
    assert_response :success
    post_via_redirect "/sessions", :session =>{:email =>email, :password => pass}

  end
end
