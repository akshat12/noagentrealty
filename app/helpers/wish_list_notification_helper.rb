# Associated files:
# item_notification_mailer.rb
# alert_user.html.erb
# alert_user.text.erb
# alert_user_item_array.html.erb
# alert_user_item_array.text.erb
# wish_lists_controller.rb
# items_controller.rb

module WishListNotificationHelper
	#Notifies the user that an item matching one of their wish list items has been added to the inventory
	def alert_user(item,wish_list)
		@item = item 
		@wish_list = wish_list 
		#if @item.class == Array
			#ItemNotificationMailer.alert_user_item_array(@item ,wish_list).deliver 
			@wish_list.each do|wish_list_item| 
			  ItemNotificationMailer.alert_user(item ,wish_list_item).deliver 
      end
  end

  #Checks for Wishlist items which match the inventory item argument
	#Used when an item has been created
  #Called in items_contoller.rb create method
  def check_wishlist(item)
     #Query wish lists to see if the criteria matches
     @wish_list = search_wishlist(item)
     @notify_list = Array.new
     @wish_list.each do |wish_list_item|
    if @notify_list.size == 0
        @notify_list.push wish_list_item
    else 
        @inList = false
        #Checks to see if the user of the wish list is already in the notificaiton list 
        @notify_list.each do|notify_list_item| 
      		if notify_list_item.user_id ==  wish_list_item.user_id
							@inList = true 
							break 
         end 
        end 
        if @inList == false 
					@notify_list.push wish_list_item 
        end
      end	
    end
    alert_user(item, @notify_list)
  end
  
  private
  
  #Algorithm used for wishlist matching
	def search_wishlist(item) 
    
     # Go through the wish lists in the data base and search for matching criteria
    
    if(item.description != nil)
      @description_match = WishList.where('description ILIKE ? ', "%#{item.description}%")
      @wish_list = @wish_list | @description_match
    end
    
     if(item.condition)
        @condition_match = Array.new
        if(item.condition == '%' || item.condition == 'Rough') 
          @condition_match = WishList.where('condition LIKE ?','Rough')
        elsif(item.condition == 'Fair')
          @condition_match = WishList.where('condition LIKE ? OR condition LIKE ?','Rough','Fair')
        elsif(item.condition == 'Good')
          @condition_match = WishList.where('condition LIKE ? OR condition LIKE ? OR condition LIKE ?','Rough','Fair', 'Good')
        elsif(item.condition == 'Excellent')
          @condition_match = WishList.where('condition LIKE ? OR condition LIKE ? OR condition LIKE ? OR condition LIKE ?','Rough','Fair', 'Good', 'Excellent')
        elsif(item.condition == 'Like New')
          @condition_match = WishList.where('condition LIKE ? OR condition LIKE ? OR condition LIKE ? OR condition LIKE ? OR condition LIKE ?','Rough','Fair', 'Good', 'Excellent', 'Like New')
        end
        @wish_list = @wish_list & @condition_match
      end   
    
    if(item.price != nil)
      @price_match = WishList.where('price IS NOT NULL AND price >= ?', item.price)
      @wish_list = @wish_list & @price_match 
    end
    
    if(item.weight != nil)
        @weight_match = WishList.where('weight IS NOT NULL AND weight >= ?', item.weight)
        @wish_list = @wish_list & @weight_match 
    end
    
    if(item.location != nil)
        @location = WishList.where('location ILIKE ?',item.location.address )
        @wish_list = @wish_list & @location 
    end
    
    if(item.length != nil)
      @length = WishList.where('length >= ?',item.length )
      @wish_list = @wish_list & @length 
    end
    
    if(item.width != nil)
      @width = WishList.where('width >= ?',item.width )
      @wish_list = @wish_list & @width 
    end
    
    if(item.height != nil)
      @height = WishList.where('height >= ?',item.height )
      @wish_list = @wish_list & @height 
    end
    
     @wish_list = WishList.where('user_id != ? AND name ILIKE ? AND category LIKE ? AND quantity <= ? AND available_until >= ?', item.user_id, "%#{item.name}%",item.category, item.quantity, item.available_from)
    
    return @wish_list
	end
end
