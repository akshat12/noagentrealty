# app/controllers/messages_controller.rb

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

class MessagesController < ApplicationController
	
	# GET /messages/new
	# New Message
	def new
		# Create a new message
		@message = Message.new
	end

	# POST /messages
	# Create Message
	def create
		# Create the message using the parameters from the current user's request
		@message = Message.new(params[:message])
		# Find the recipient of the message
		@user = User.find(params[:user_id])

		# Check if message is valid
		# Case 1: Message is valid
		if @message.valid?
			# Send the current user's message to the recipient user
			UserMailer.contact_user(@user, @message).deliver
			# Redirect the current user to the recipient user's profile page
			# Display message informing the current user that their message has been sent
			redirect_to @user, notice: "Message sent!"
		# Case 2: Message is invalid
		else
			# Render the new message form with any errors
			render "new"
		end
	end

end