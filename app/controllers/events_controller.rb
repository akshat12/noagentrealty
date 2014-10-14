# app/controllers/events_controller.rb

class EventsController < ApplicationController
  before_filter :authenticate
  # Check if the current user is signed in
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  # Check if the current user is the owner of the requested resource
  before_filter :correct_user, only: [:edit, :update]
  # Check if the current user has permissions to delete the requested resource
  before_filter :can_destroy, only: [:destroy]

  # GET /events
  # GET /events.json
  # Display all events
  def index
    # Find events where the date is today or a future date
    @items = Event.where('event_date >= ?',Date.today) 
    
    # Paginate all the events
    @events = @items.page(params[:page]).per(9)
    @events.sort!{|a,b| a.event_date <=> b.event_date}

    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /events/1
  # GET /events/1.json
  # Display a specific event
  def show
    # Find event in the DB based on "id" parameter from the current user's request
    @event = Event.find(params[:id])
    @location = @event.location

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  # New Event
  def new
    # Create a new event
    @event = Event.new
    # Set default values for event attributes
    @event.location = Location.new
    @event.start_time = Time.now
    @event.end_time = (Time.now + 60*60)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  # Edit Event
  def edit
    # Find event in the DB
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  # Create Event
  def create
    # Get the current user
    @user = current_user
    # Create the event using the parameters from the user's request
    @event = @user.events.build(params[:event])

    respond_to do |format|
      # Save the event to the DB
      # Case 1: Event saved
      if @event.save
        # Redirect the user to the event details (show) page
        # Display success message
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      # Case 2: Event not saved
      else
        # Render the new event form and display errors
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  # Update Event
  def update
    # Find event in the DB
    @event = Event.find(params[:id])

    respond_to do |format|
      # Update event in the DB
      # Case 1: Event update successful
      if @event.update_attributes(params[:event])
        # Redirect the user to the event details page
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      # Case 2: Event update unsuccessful
      else
        # Render the edit event form with errors
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  # Delete Event
  def destroy
    # Find event in the DB
    @event = Event.find(params[:id])
    # Delete event from the DB
    @event.destroy

    respond_to do |format|
      # Redirect the current user to the events index page
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private

    # Redirect the user to the events index page unless the user owns the requested resource
    def correct_user
      @event = Event.find(params[:id])
      redirect_to(events_path) unless current_user?(@event.user)
    end

    # Redirect the user to the events index page unless the user owns the requested resource or the user is an admin
    def can_destroy
      @event = Event.find(params[:id])
      redirect_to(events_path) unless current_user?(@event.user) || current_user.admin?
    end

end
