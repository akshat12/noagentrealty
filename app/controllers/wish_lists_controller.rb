# app/controllers/wish_lists_controller.rb

class WishListsController < ApplicationController
	
	include WishListNotificationHelper
	before_filter :authenticate
    before_filter :signed_in_user
	before_filter :correct_user, only: [:edit, :update, :destroy]
	
	# GET /wish_lists
	# GET /wish_lists.json
  # Display current user's wishlist items
	def index  	
      @wish_list = WishList.where(:user_id => current_user)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wish_list }
    end
  end
  
  # GET /wish_lists/new
  # GET /wish_lists/new.json
  # Create a new wish list item (form)
  def new
	  @wish_list = WishList.new
    @wish_list.available_until = (Date.today + 7).strftime("%Y-%m-%d")
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wish_list }
    end
  end
  
  # POST /wish_lists
  # POST /wish_lists.json
  # Create a new wish list item (process request)
  def create

  @wish_list = WishList.new(params[:wish_list])
  @wish_list.user = current_user
	  respond_to do |format|
		  if @wish_list.save
			  format.html { redirect_to @wish_list, notice: 'The Wish List item was successfully created.' }
        format.json { render json: @wish_list, status: :created, location: @wish_list }
		  else
			  format.html { render action: "new" }
			  format.json { render json: @wish_list.errors, status: :unprocessable_entity }
		  end
	  end	
  end
  
  # GET /wish_lists/1/edit
  # Edit an existing wish list item (form)
  def edit
	@wish_list = WishList.find(params[:id])
  end
  
  # GET /users/1
  # GET /users/1.json
  # Display a specific wishlist item
  def show
    @wish_list = WishList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wish_list }
    end
  end
  
  # PUT /wish_lists/1
  # PUT /wish_lists/1.json
  # Update an existing wish list item
  def update
    @wish_list = WishList.find(params[:id])

    respond_to do |format|
      if @wish_list.update_attributes(params[:wish_list])
        format.html { redirect_to @wish_list, notice: 'The Wish List item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wish_list.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /wish_lists/1
  # DELETE /wish_lists/1.json
  # Delete a wish list item
  def destroy
    @wish_list = WishList.find(params[:id])
    @wish_list.destroy

    respond_to do |format|
      format.html { redirect_to wish_lists_url }
      format.json { head :no_content }
    end
  end
 
 private 
 
 # Check if the requested wish list item belongs to the current user
 def correct_user
	@wish_list = WishList.find(params[:id])
	redirect_to(root_path) unless current_user?(@wish_list.user)
 end
 
end
