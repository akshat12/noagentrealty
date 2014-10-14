require 'test_helper'

class TwoComponentTest < ActionDispatch::IntegrationTest
   fixtures :all
   pass = "123456"
   email = "email@host.org"
   name = "bubba"

# ---------------   Flag and Event ----------------------
  # Test Case EF00: Event flagged
   test "flag event" do
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

# Test Case EU00 create event
   test "user create event" do
        create_account  
        sign_in
        
        curr_size = Event.count

        get ('/events/new')
        assert_response :success


        post_via_redirect ('/events' ), event:{ name:'test_event', description: 'desc', event_date: Date.today, start_time: Time.now, location_attributes:{address:'pub'}}
        assert_equal 'Event was successfully created.', flash[:notice]

        event = Event.where('name = ?','test_event')       
 
        assert_equal(Event.count,(curr_size +1))
        assert_not_equal [],event
        get('/events/' + event.first.id.to_s)
        assert_response :success

   end
# Test Case EU01 user can delete event
   test "user delete event" do
        create_account  
        @user.admin = true
        @user.save
        sign_in

        curr_size = Event.count
        event = events(:test_event1)  

        get('/events')
        assert_response :success

        delete_via_redirect ('/events/' + event.id.to_s )
        assert_equal(Event.count,curr_size -1)
        assert_equal [],Event.where('name = ?','party')

   end

# Test Case EL00 event can have a location
   test "event location" do
        create_account  
        sign_in


         post_via_redirect ('/events' ), event:{ name:'test_event', description: 'desc', event_date: Date.today, start_time: Time.now, location_attributes:{address:'pub'}}
        assert_equal 'Event was successfully created.', flash[:notice]


        event = Event.where('name = ?','test_event').first  
 
        get('/events/' + event.id.to_s+ '/edit')
        assert_response :success

        put_via_redirect ('/events/' + event.id.to_s ), event:{ name:'new_name', description: 'desc', event_date: Date.today, start_time: Time.now, location_attributes:{address:'park'}}
        assert_equal 'Event was successfully updated.', flash[:notice]

   end





# ---------------  Flag and Project ----------------------
  # Test Case FP00: flag a project
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



# ---------------  Flag and User ----------------------
  # Test Case FU00: flag a user
   test "user flag " do
        create_account  
        sign_in
        
        user = users(:search_user1)
        curr_size = Flag.count

        get ('/users/' + user.id.to_s + '/flags/new')
        assert :success
       
        post_via_redirect ('/users/' + user.id.to_s + '/flags' ), flag:{ reason:'MyReason', comment: 'MyComment'}
        assert_equal 'Report was successfully submitted.', flash[:notice]

        
        assert_equal(Flag.count,(curr_size +1))
        assert_not_equal [],Flag.where('flaggable_id = ? AND reason = ?',user.id,'MyReason')
   end

# ---------------  Item & Location ----------------------
  # Test Case IL00: An item can have an associated location
   test "location and item" do

        create_account  
        sign_in
        
        post_via_redirect ('/items' ), item:{ name:'Myitem', description: 'it_desc', image_cache: "",category: 'Lumber',condition: 'Rough',quantity: 4,available_from: Date.today, available_until: Date.today.next_month,location_attributes:{address:'ubc'}}
        assert_equal 'Item was successfully created.', flash[:notice]

        item = Item.where('name = ?','Myitem').first       
        
        get('/items/' + item.id.to_s+ '/edit')
        assert_response :success

        put_via_redirect ('/items/' + item.id.to_s ),item:{ name:'new_Name', description: 'it_desc', image_cache: "",category: 'Lumber',condition: 'Good',quantity: 4,available_from: Date.today, available_until: Date.today.next_month,location_attributes:{address:'ubc'}}
        assert_equal 'Item was successfully updated.', flash[:notice]

        get('/items/' + item.id.to_s)
        assert_response :success


   end

# ---------------  Item/user and Message ----------------------
  # Test Case IM00 & MU00: user can send a meesage from an item 
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



# ---------------  User & Item ----------------------
  # Test Case IU00: user can create item
   test "user and item" do

        create_account  
        sign_in
        
        curr_size = Item.count

        get ('/items/new')
        assert_response :success


        post_via_redirect ('/items' ), item:{ name:'Myitem', description: 'it_desc', image_cache: "",category: 'Lumber',condition: 'Rough',quantity: 4,available_from: Date.today, available_until: Date.today.next_month,location_attributes:{address:'ubc'}}
        assert_equal 'Item was successfully created.', flash[:notice]

        item = Item.where('name = ?','Myitem')       
 
        assert_equal(Item.count,(curr_size +1))
        assert_not_equal [],item
        get('/items/' + item.first.id.to_s)
        assert_response :success


   end

  # Test Case IU01: user can delete item
   test "user delete item" do

        create_account  
        sign_in
        
        curr_size = Item.count

        get ('/items/new')
        assert_response :success


        post_via_redirect ('/items' ), item:{ name:'Myitem', description: 'it_desc', image_cache: "",category: 'Lumber',condition: 'Rough',quantity: 4,available_from: Date.today, available_until: Date.today.next_month,location_attributes:{address:'ubc'}}
        assert_equal 'Item was successfully created.', flash[:notice]

        item = Item.where('name = ?','Myitem')       

        get('/items')
        assert_response :success
        delete_via_redirect ('/items/' + item.first.id.to_s )
        assert_equal(Item.count,curr_size )
        assert_equal [],Item.where('name = ?','new_Name')


   end


  # Test Case IU02: user can view an item
   test "user view item" do

        create_account  
        sign_in
       
        get ('/items/' + Item.first.id.to_s)
        assert_response :success


   end


  # Test Case IU03: owner can modify item
   test "user edit item" do

        create_account  
        sign_in
        
        curr_size = Item.count

        get ('/items/new')
        assert_response :success


        post_via_redirect ('/items' ), item:{ name:'Myitem', description: 'it_desc', image_cache: "",category: 'Lumber',condition: 'Rough',quantity: 4,available_from: Date.today, available_until: Date.today.next_month,location_attributes:{address:'ubc'}}
        assert_equal 'Item was successfully created.', flash[:notice]

        item = Item.where('name = ?','Myitem')       
 
        get('/items/' + item.first.id.to_s+ '/edit')
        assert_response :success

        put_via_redirect ('/items/' + item.first.id.to_s ),item:{ name:'new_Name', description: 'it_desc', image_cache: "",category: 'Lumber',condition: 'Good',quantity: 4,available_from: Date.today, available_until: Date.today.next_month,location_attributes:{address:'ubc'}}
        assert_equal 'Item was successfully updated.', flash[:notice]
        assert_equal(Item.count,(curr_size +1))
        assert_not_equal [],Item.where('name = ?','new_Name')

       


   end




#---------------------News and user--------------
 # Test Case NU00: user can create news
   test "user create news" do
        create_account  
        @user.admin = true
        @user.save
        sign_in
        
        curr_size = News.count

        get ('/news/new')
        assert_response :success


        post_via_redirect ('/news' ), news:{ title:'myNews', content: 'stuff', image_cache: ""}
        assert_equal 'News was successfully created.', flash[:notice]

        nws = News.where('title = ?','myNews')       
 
        assert_equal(News.count,(curr_size +1))
        assert_not_equal [],nws
        get('/news/' + nws.first.id.to_s+ '/edit')
        assert_response :success

        
        get('/news')
        assert_response :success
       
   end


 # Test Case NU01: user can delete news
   test "user delete news" do
        create_account  
        @user.admin = true
        @user.save
        sign_in
        

        curr_size = News.count

        get('/news')
        assert_response :success
        nws = news(:news_test1)

        delete_via_redirect ('/news/' + nws.id.to_s )
        assert_equal(News.count,curr_size-1 )
        assert_equal [],News.where('content = ?','delete me')

   end

 # Test Case NU02: user can modify news
   test "user modify news" do
        create_account 
        @user.admin = true
        @user.save 
        sign_in
        
        nws = news(:news_test1)
 
        
        get('/news/' + nws.id.to_s+ '/edit')
        assert_response :success

        put_via_redirect ('/news/' + nws.id.to_s ), news:{ title:'new title', content: 'HI', image: 'TestImagePath' }
        assert_equal 'News was successfully updated.', flash[:notice]

        get('/news/' + nws.id.to_s)
        assert_response :success
        
   end

 # Test Case NU03: user can view news
   test "user view news" do
        create_account  
        sign_in
        
        get('/news')
        assert_response :success

        get('/news/' + News.first.id.to_s)
        assert_response :success
        
   end

#-----------preference and user
#PU00 - user can modify preference
   test 'user modify preferences' do
        create_account  
        @user.admin=true
        @user.save
        sign_in
     
        get('/dash')
        assert_response :success

        preference = Preference.new(:name =>'notify_email', :preference_value =>"0")
        preference.user_id = @user.id
        assert preference.save

       # put_via_redirect '/admin/update_preferences?id=' + @preference.id.to_s, :preference=>{:name =>'notify_email', :preference_value =>"1", :id => @user.id.to_s}
        #assert_equal 'Preferences successfully updated.', flash[:notice]

        #put_via_redirect "/admin/update_preferences?id=" + @preference.id.to_s, :preference=>{:name =>'notify_email', :preference_value =>"0", :id =>@user.id.to_s}
        #assert_equal 'Preferences successfully updated.', flash[:notice]


  end



# ---------------  User &  Project ----------------------
  # Test Case PU00: User can create a project
   test "user create project" do
        create_account  
        sign_in
        

        get ('/projects/new')
        assert_response :success


        post_via_redirect ('/projects' ), project:{ name:'test_project', description: 'DESC', image_cache: ""}
        assert_equal 'Project was successfully created.', flash[:notice]

        proj = Project.where('name = ?','test_project')       
 
        get('/projects/' + proj.first.id.to_s+ '/edit')
        assert_response :success


        get('/projects/' + proj.first.id.to_s )
        assert_response :success

end

# Test Case PU01: User can view a project
   test "user view project" do
        create_account  
        sign_in
        

        get('/projects')
        assert_response :success

        get('/projects' + Project.first.id.to_s)
        assert_response :success
     
     

   end

# Test Case PU02: owner can delete projects
   test "owner can delete project" do
        create_account  
        sign_in
        
        curr_size = Project.count

        get ('/projects/new')
        assert_response :success


        post_via_redirect ('/projects' ), project:{ name:'test_project', description: 'DESC', image_cache: ""}
        assert_equal 'Project was successfully created.', flash[:notice]

        get('/projects')
        assert_response :success

        prj = Project.where('name = ?', 'test_project').first
        delete_via_redirect ('/projects/' + prj.id.to_s )
        assert_equal(Project.count,curr_size )
        assert_equal [],Project.where('name = ?','test_project')
     

   end
      

# Test Case PU03: User can update project
   test "user update project" do
        create_account  
        sign_in
        

        get ('/projects/new')
        assert_response :success


        post_via_redirect ('/projects' ), project:{ name:'test_project', description: 'DESC', image_cache: ""}
        assert_equal 'Project was successfully created.', flash[:notice]

        proj = Project.where('name = ?','test_project')       
 
        get('/projects/' + proj.first.id.to_s+ '/edit')
        assert_response :success

        put_via_redirect ('/projects/' + proj.first.id.to_s ), project:{ name:'new name', description: 'DESC', image: 'TestImagePath' }
        assert_equal 'Project was successfully updated.', flash[:notice]
        
     

   end

#-----------User & Wishlist-------------
#Test UW00 User create wishlist item
 test 'wishlist insert' do
        create_account  
        sign_in
       
        get('/wish_lists/new')
        assert_response :success

        count = WishList.count
        
        post_via_redirect ('/wish_lists' ), wish_list:{name: 'findme',category: 'Lumber',condition:'Good',quantity:6, available_until: Date.today.next_week}
        assert_equal 'The Wish List item was successfully created.' , flash[:notice]
         
        assert_equal count+1,WishList.count

        get('/wish_lists/' + WishList.where('name = ?','findme').first.id.to_s)
        assert_response :success

        
        get('/wish_lists')
        assert_response :success

       
   
  end


#test UW02 - User delete wishlist item
 test 'wishlist deletion' do
        create_account  
        sign_in
       
        get('/wish_lists/new')
        assert_response :success

        count = WishList.count
        
        post_via_redirect ('/wish_lists' ), wish_list:{name: 'findme',category: 'Lumber',condition:'Good',quantity:6, available_until: Date.today.next_week}
        assert_equal 'The Wish List item was successfully created.' , flash[:notice]
         
        assert_equal count+1,WishList.count
        
        get('/wish_lists')
        assert_response :success

        delete_via_redirect ('/wish_lists/' + WishList.where('name = ?','findme').first.id.to_s)

        assert_equal count,WishList.count
   
  end


private
  def create_account
    pass = "123456"
    email = "email@host.org"
    name = "bubba"
    @user = User.new(:email =>email, :password => pass,:password_confirmation =>pass, :name =>name)
    @user.confirmed = true
    @user.save

  end

  def sign_in
    pass = "123456"
    email = "email@host.org"
    get "/signin"
    assert_response :success
    post_via_redirect "/sessions", :session =>{:email =>email, :password => pass}

  end
end
