# app/controllers/admin_controller.rb

class AdminController < ApplicationController
  before_filter :authenticate
  # Check to see if the current request is coming from an admin user
  before_filter :admin_user

  # GET /admin
  # random test
  # Display a list of flagged objects grouped by type and sorted in decreasing order based on the number of flags a
  def index

    # Get the current user (admin)
    @user = current_user

    # Find the current user's e-mail notification preferences
    # If not found, create a new preference for the user and set it to false as a default
    @preference = Preference.where(:name => 'notify_email', :user_id => @user.id ).first_or_create(:preference_value => false)

    # Initialize instance variables as empty array to store information about flagged objects 
    @flagged_items = Array.new
    @flagged_projects = Array.new
    @flagged_events = Array.new
    @flagged_users = Array.new

    # Count the number of flags
    # Group the flags by the flaggable object id and type to ensure that each flagged object/grouping is unique
    # Sort the flagged objects/groupings from largest to smallest (decreasing order) based on the number of flags
    @flagged = Flag.count(:group => [:flaggable_id, :flaggable_type], :order => "count_all DESC")

    # Iterate through the flagged objects
    @flagged.each do |f, count|
      # Case 1: Flagged object is a User
      if( f[1] == 'User' )
        # Insert user and number of flags (count) associated with that user into the array of flagged users
        @flagged_users << {'user' => User.find(f[0]), 'count' => count }
      # Case 2: Flagged object is an Event
    elsif( f[1] == 'Event' )
        # Insert event and number of flags into the array of flagged events
        @flagged_events << {'event' => Event.find(f[0]), 'count' => count }
      # Case 3: Flagged object is an Item
    elsif( f[1] == 'Item' )
        # Insert item and number of flags into the array of flagged items
        @flagged_items << {'item' => Item.find(f[0]), 'count' => count }
      # Case 4: Flagged object is a Project
    elsif( f[1] == 'Project')
        # Insert project and number of flags into the array of flagged projects
        @flagged_projects << {'project' => Project.find(f[0]), 'count' => count }
      # Case 5: Flagged object is none of the above (should not be possible)
    else
        # Do nothing
      end
    end
    
    # Response format to current user's request
    respond_to do |format|
      format.html # index.html.erb
      format.json { head :no_content }
    end
    
  end

  # PUT /admin/update_preferences
  # Update user (admin) preferences
  def update_preferences
    # Find preference in the DB based on the "id" parameter from the current user's request
    @preference = Preference.find(params[:id])

    respond_to do |format|
      # Update the current user's preferences in the DB
      # Case 1: Update Successful
      if @preference.update_attributes(params[:preference])
        # Redirect the current user back to the previous page and display success message
        format.html { redirect_to :back, notice: 'Preferences successfully updated.' }
        format.json { head :no_content }
      # Case 2: Update Failed
    else
        # Redirect the current user back to the previous page and display failure message
        format.html { render_to :back, notice: 'Failed to update preferences.' }
        format.json { render json: @preference.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /admin/flagged_events
  # Displays a list of all flagged events
  def flagged_events
    @flagged_events = Array.new
    Flag.all.each do |f|
      if(f.flaggable_type == 'Event')
        @flagged_events << {'event' => Event.find(f.flaggable_id),'flag' => f, 'user' => User.find(f.user_id)}
      end
    end
  end
  
  # GET /admin/flagged_items
  # Displays a list of all flagged items
  def flagged_items
    @flagged_items = Array.new
    Flag.all.each do |f|
      if(f.flaggable_type == 'Item')
        @flagged_items << {'item' => Item.find(f.flaggable_id),'flag' => f, 'user' => User.find(f.user_id)}
      end
    end
  end
  
  # GET /admin/flagged_projects
  # Displays a list of all flagged projects
  def flagged_projects
    @flagged_projects = Array.new
    Flag.all.each do |f|
      if(f.flaggable_type == 'Project')
        @flagged_projects << {'project' => Project.find(f.flaggable_id),'flag' => f ,'user' => User.find(f.user_id)}
      end
    end
  end

  # GET /admin/flagged_users
  # Displays a list of all flagged users
  def flagged_users
    @flagged_users = Array.new
    Flag.all.each do |f|
      if(f.flaggable_type == 'User')
        @flagged_users << {'flagged_user' => User.find(f.flaggable_id), 'flag' => f, 'user' => User.find(f.user_id)}
      end
    end
  end

  # GET /admin/banned_users
  # Displays a list of all banned userse
  def banned_users
    @banned_users = Array.new
    User.all.each do |f|
      if(f.banned)
        @banned_users << {'banned_user' => User.find(f.id)}
      end
    end
  end

  # PUT /admin/ban_user
  # Ban a user
  def ban_user
    # Find user in the DB
    @user = User.find(params[:user])

    # Change the user's "banned" status
    @user.update_attribute('banned',params[:ban])

    respond_to do |format|
     # Case 1: User is banned 
     if(params[:ban] == 'true')
      format.html { redirect_to banned_users_admin_index_url, notice: 'User banned' }
     # Case 2: User is unbanned
     else
      format.html { redirect_to banned_users_admin_index_url, notice: 'User reactivated' }
     end
      format.json { head :no_content }
    end
  end

  private

    # Redirect current user to the home page unless the user is an admin
    def admin_user
      redirect_to(root_path) unless is_admin?
    end
end
