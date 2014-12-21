# app/controllers/home_controller.rb

class HomeController < ApplicationController
	before_filter :authenticate
  
  # GET /
  # Home Page
  # Display all available items
  def index
  		# Set cur_day to today's date
      cur_day = Date.today
    
    	# Find all items that are available based on date
      #@inventory = Properties.where("available_from <= ?", cur_day, cur_day)
      # @inventory = RentalProperties.all
      @inventory = Item.all

      # Paginate items
      @items = Kaminari.paginate_array(@inventory).page(params[:page]).per(9)

      
  end

  def not_found
    respond_to do |format|
      format.html { render '404' }
    end
  end

  # GET /contact
  # Contact Us Form
  def contact
    # Create a new message
    @message = Message.new
  end

  # POST /contact_create
  # Submit Contact Us Request
  def contact_create
    # Create the message using the parameters from the current user's request
    @message = Message.new(params[:message])

    # Check if message is valid
    # Case 1: Message is valid
    if @message.valid?
      # Send the current user's message to the recipient user
      UserMailer.contact_us(@message).deliver
      # Redirect the current user to the recipient user's profile page
      # Display message informing the current user that their message has been sent
      redirect_to root_path, notice: "Message sent!"
    # Case 2: Message is invalid
    else
      # Render the new message form with any errors
      render "contact"
    end
  end
  
end