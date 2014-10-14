# app/controllers/password_resets_controller.rb

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

class PasswordResetsController < ApplicationController

  # GET /password_resets/new
  # Display the password reset request form
  def new
  end

  # POST /password_resets
  # Process user request to reset password
  def create
    # Find user by e-mail in DB
  	user = User.find_by_email(params[:password_reset][:email])
    # Send password reset instructions to user's e-mail if user exists
  	user.send_password_reset if user
    # Redirect the user to the home page
    # Display a message informing the user that password reset instructions have been sent to their e-mail
  	redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  # GET /password_resets/1/edit
  # Display the password reset form
  def edit
    # Find user in DB by password reset token
  	@user = User.find_by_password_reset_token!(params[:id])
  end


  # PUT /password_resets
  # Update the user's password
  def update
    # Find user in DB by password reset token
  	@user = User.find_by_password_reset_token!(params[:id])
    # Check when password reset instructions were sent
    # Case 1: More than 2 hours ago
  	if @user.password_reset_sent_at < 2.hours.ago
      # Redirect user to password reset request form
      # Notify the user that their password reset has expired
  		redirect_to new_password_reset_path, :alert => "Password reset has expired."
    # Case 2: Update the User
  	elsif @user.update_attributes(params[:user])
      # Redirect the user to the home page
      # Display a message informing the user that their password has been reset
  		redirect_to root_url, :notice => "Password has been reset!"
    # Case 3: Update failed
  	else
      # Render the password reset form
  		render :edit
  	end
  end

end
