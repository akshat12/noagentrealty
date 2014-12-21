# app/controllers/items_controller.rb

class ItemsController < ApplicationController

  include WishListNotificationHelper
  before_filter :authenticate
  # Check if the current user is signed in
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy, :myItems]
  # Check if the current user is the owner of the requested resource
  before_filter :correct_user, only: [:edit, :update]
  # Check if the current user has permissions to delete the requested resource
  before_filter :can_destroy, only: [:destroy]

  # GET /items
  # GET /items.json
  # Display all items
  def index
    # Check if the current user's request contains a category value
    # Case 1: Category exists. We need to be checking if region exists
   # if params.has_key?(:category)
      # Find all items that are under the requested category
    #  @inventory = RentalProperties.where('available_until >= ? AND category = ?',Date.today, params[:category]) 
    # @inventory.sort!{|a,b| a.available_until <=> b.available_until}
    # Case 2: Category does not exist 
  #else
      # Find all available items
      #@inventory = Item.where('available_until >= ?', Date.today)
      #@inventory.sort!{|a,b| a.available_until <=> b.available_until}
   # end

   #@inventory = Items.all
   #@inventory = Item.all

	  # Paginate items
	  #@items = Kaminari.paginate_array(@inventory).page(params[:page]).per(9)
    #

      @inventory = Item.all

      # Paginate items
      @items = Kaminari.paginate_array(@inventory).page(params[:page]).per(9)
      #@csv = Items.order(:id)

	  
    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @items }
    # Export statistics to CSV file
    if is_admin?
      format.csv { send_data @csv.to_csv }
      format.xls { send_data @csv.to_csv(col_sep: "\t") }
    end

  end
end

  # GET /items/1
  # GET /items/1.json
  # Display a specific item
  def show
    # Find item from DB
    @item = Item.find(params[:id])
    # Get item location
    #@location = @item.postal_code

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  # New Item
  def new
    # Create a new item
    @item = Item.new
    # Set default values for item attributes
    #@item.location = Location.new
    @item.available_from = Date.today.strftime("%Y-%m-%d")
    #@item.available_until = (Date.today + 30).strftime("%Y-%m-%d")

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  # Edit Item
  def edit
    # Find item in DB
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  # Create Item
  def create
    # Get current user
    @user = current_user
    # Create the item using the parameters from the user's request
    @item = @user.items.build(params[:item])

    respond_to do |format|
      # Save the item to the DB
      # Case 1: Item saved
      if @item.save
        # Redirect the user to the items detail (show) page
        # Display success message
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
        # Checks to see if any wish list contains the newly added item
        #check_wishlist(@item)
      else
        # Render the new item form with any errors
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  # Update Item
  def update
    # Find item in DB
    @item = RentalProperties.find(params[:id])

    # Update the available_from date if older than today's date
    if (@item.available_from) < Date.today
     params[:item][:available_from] = Date.today
   end

   respond_to do |format|
      # Update the item in the DB
      # Case 1: Item is updated
      if @item.update_attributes(params[:item])
        # Redirect the user to the items detail (show) page
        # Display success message
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      # Case 2: Item is not updated
    else
        # Render the edit item form with any errors
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    # Find item in DB
    @item = RentalProperties.find(params[:id])

    # Create copy of item for statistics
    @olditem = OldProperties.new
    @olditem.name = @item.name
    @olditem.description = @item.description
    @olditem.property_type = @item.property_type
    @olditem.rent = @item.rent
    @olditem.number_of_bathrooms = @item.number_of_bathrooms
    @olditem.number_of_rooms = @item.number_of_rooms
    @olditem.number_of_study = @item.number_of_study
    @olditem.lease_duration = @item.lease_duration
    @olditem.postal_code = @item.postal_code
    @olditem.user_id = @item.user_id
    @olditem.available_from = @item.available_from
    @olditem.furnished = @item.furnished
    @olditem.reason = "Not given"

    @olditem.save

    # Delete the item
    @item.destroy

    respond_to do |format|
      # Redirect the user to feedback form if user deleted item
      if(!current_user.admin?)
       format.html { redirect_to reason_url(:id => @olditem.id) }
       format.json { head :no_content }
      else
       format.html { redirect_to root_url }
       format.json { head :no_content }
      end
    end
  end
  
  # GET /items/myItems
  # Display the current user's items
  def myItems
    # Find the current user's items
    @inventory = RentalProperties.where(:user_id => current_user)
    @user = current_user    
    
    @items = Kaminari.paginate_array(@inventory).page(params[:page]).per(9)

    respond_to do |format|
      format.js
      format.html # myItems.html.erb
      format.json { render json: @items }
    end
  end
  


  private
    # Redirect the user to the items index page unless the user owns the requested resource
    def correct_user
      @item = RentalProperties.find(params[:id])
      redirect_to(root_path) unless current_user?(@item.user)
    end
    # Redirect the user to the items index page unless the user owns the requested resource or the user is an admin
    def can_destroy
      @item = RentalProperties.find(params[:id])
      redirect_to(root_path) unless current_user?(@item.user) || current_user.admin?
    end

end
