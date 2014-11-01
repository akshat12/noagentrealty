class ItemNotificationMailer < ActionMailer::Base
  default from: "noagentprops@gmail.com"
	# Sends an email to the user of the wish list if the system finds a match between a wish list item and a item
	def alert_user(item, wish_list)
		@item = item
		@wish_list = wish_list
		@user = User.find(@wish_list.user_id)
		mail(:to => @user.email, :subject => "New Notifications for your Wish List") 
	end
	def alert_user_item_array(item, wish_list)
		@item = item
		@wish_list = wish_list
		@user = User.find(@wish_list.user_id)
		mail(:to => @user.email, :subject => "New Notifications for your Wish List") 
	end
end