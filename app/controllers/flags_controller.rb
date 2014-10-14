# app/controllers/flags_controller.rb

# Copyright (c) 2008 Ryan Bates
 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

class FlagsController < ApplicationController
	before_filter :authenticate
  before_filter :signed_in_user, only: [:new, :create, :destroy, :index]
  before_filter :check_flagged,  only: [:new, :create]
  before_filter :admin_user,     only: [:destroy, :index]

  # GET /flags
  # Display all flags for a given object
	def index
		# Find the flagged object
		@flaggable = find_flaggable
		# Retrieve the flags associated with the object
		@flags = @flaggable.flags
	end

	# GET /flags/new
	# New Flag
	# Allows users to flag an object by submitting a form
	def new
		@flaggable = find_flaggable
		@flag = Flag.new
	end

	# POST /flags
	# Create Flag
	def create
		# Find the flaggable object
		@flaggable = find_flaggable
		# Create a new flag for that object
		@flag = @flaggable.flags.build(params[:flag])
		# Set the current user as the owner of the flag (reported by)
		@flag.user = current_user

		respond_to do |format|
			# Save the flag to the DB
			# Case 1: Flag saved
			if @flag.save
				# Redirect the current user to the home page
				format.html { redirect_to @flaggable, notice: 'Report was successfully submitted.' }
				format.json { render json: @flaggable, status: :created, location: @flaggable }
				
				# Find all admin users from the DB
				@admins = User.find(:all, :conditions => { :admin => 'true' })

				# Iterate through the list of admin users
				@admins.each do |admin|
					# Check if the admin has a preference set for e-mail notifications
					# If not, create a new preference for that admin and set it to false by default
					@preference = Preference.where(:name => 'notify_email', :user_id => admin.id ).first_or_create(:preference_value => false)

					# Case 1: Preference set to true
					if @preference.preference_value
						# Notify admin about the flagged object via e-mail
						UserMailer.notify_flag(admin, @flag, @flaggable).deliver
					end
				end
			# Case 2: Flag not saved
			else
				# Render the new flag form and display any errors
				format.html { render action: "new" }
				format.json { render json: @flaggable.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /flags/1
	# Delete Flag (Only Admin)
	def destroy
		# Find the flag in the DB
		@flag = Flag.find(params[:id])
		# Delete the flag
		@flag.destroy

		respond_to do |format|
			# Redirect the user (admin) back to the admin dashboard
			format.html { redirect_to admin_index_url,notice: 'Flag deleted'  }
			format.json { head :no_content }
		end
	end

	# Find an object type that is flaggable
	def find_flaggable
		params.each do |name, value|
			if name =~ /(.+)_id$/
				return $1.classify.constantize.find(value)
			end
		end
		nil
	end

	private

		# Redirect the user to the home page unless the user is an admin
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    # Redirect the user if the user already flagged the object
    def check_flagged
    	@flaggable = find_flaggable
    	flagged = @flaggable.flags.find_by_user_id(current_user.id)
    	
    	redirect_to(@flaggable, notice: "You have already flagged this object.") unless !flagged
    end
end
