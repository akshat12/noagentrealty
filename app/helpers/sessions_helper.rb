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

module SessionsHelper

	# Sign the user in
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	# Sign the user out
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	# Check if the user is signed in
	def signed_in?
		!current_user.nil?
	end

	# Check if the user is an admin
	def is_admin?
		if(signed_in?)
			return current_user.admin?
		end
		false
	end
	
	# Redirect the user to the sign in page if they are not currently signed in
	def signed_in_user
		unless signed_in?
			# Store the user's requested page
			store_location
			# Redirect the user to the sign in page
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	# Redirect the user to their profile unless they are not currently signed in
	def new_user
		unless !signed_in?
			@user = current_user
			redirect_to @user
		end
	end

	# Set current_user to user
	def current_user=(user)
		@current_user = user
	end

	# Find current_user by associating them with their remember token
	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	# Check if user is the same as current_user
	def current_user?(user)
		user == current_user
	end

	# Redirect the user to their last requested page else default
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	# Store the user's requested page
	def store_location
		session[:return_to] = request.url
	end

	protected

		# HTTP Authentication
    def authenticate
      #authenticate_or_request_with_http_basic "Authentication Required" do |username, password|
      #username == "cfzadm" && password == "cfzpass"
      #end
    end
end
