# app/controllers/sessions_controller.rb

# The MIT License
# Copyright (c) 2012 Michael Hartl
# http://opensource.org/licenses/mit-license.php

# /*
#  * ----------------------------------------------------------------------------
#  * "THE BEER-WARE LICENSE" (Revision 42):
#  * Michael Hartl wrote this code. As long as you retain this notice you
#  * can do whatever you want with this stuff. If we meet some day, and you think
#  * this stuff is worth it, you can buy me a beer in return.
#  * ----------------------------------------------------------------------------
#  */

class SessionsController < ApplicationController
	before_filter :authenticate
	before_filter :new_user, only: [:new, :create]
	before_filter :signed_in_user, only: [:destroy]
	
	# New Session (Sign In Form)
	def new
		render 'new'
	end

	# Create Session (Sign In)
	def create
				 # Find the user using the e-mail address supplied in the request
				 user = User.find_by_email(params[:session][:email].downcase)

				 # Check if the user exists and authenticate their credentials
				 if user && user.authenticate(params[:session][:password])
				 	# Check if the user has confirmed their account
				 	# User not confirmed
				 	if !user.confirmed
				 		flash.now[:error] = 'Please confirm your account via email'
				 		render 'new'
				 	# User banned
				 	elsif user.banned
				 		flash.now[:error] = 'You have been banned!'
				 		render 'new'
				 	# User gets signed in
				 	else 
				 		sign_in user
				 		# Redirect the user to their last requested page else the home page
				 		redirect_back_or root_url
				 	end
				 else
	    # Create an error message and re-render the signin form.
	    flash.now[:error] = 'Invalid email/password combination'
	    render 'new'
	  end
	end

	# Destroy Session (Sign Out)
	def destroy
		sign_out
		redirect_to root_url
	end

end
