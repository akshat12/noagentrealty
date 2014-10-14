# app/controllers/news_controller.rb

class NewsController < ApplicationController
  before_filter :authenticate
  # Check to see if the current request is coming from an admin user
  before_filter :admin_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  # Display all news
  def index
    # Find all news from the DB
    @news = News.all
    @news.sort!{|a,b| b.created_at <=> a.created_at}

    @items = Kaminari.paginate_array(@news).page(params[:page]).per(3)
    
    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /news/1
  # GET /news/1.json
  # Display specific news
  def show
    # Find news from the DB
    @news = News.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/new
  # GET /news/new.json
  # New News
  def new
    # Create new news
    @news = News.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news }
    end
  end

  # GET /news/1/edit
  # Edit News
  def edit
    # Find news in DB
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.json
  # Create News
  def create
    # Get current user
    @user = current_user
    # Create news using the parameters from the user's request
    @news = @user.news.build(params[:news])

    respond_to do |format|
      # Save the news
      # Case 1: News saved
      if @news.save
        # Redirect the user to the news details (show) page
        # Display success message
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render json: @news, status: :created, location: @news }
      # Case 2: News not saved
      else
        # Render new news form and display any errors
        format.html { render action: "new" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.json
  # Update News
  def update
    # Find news in DB
    @news = News.find(params[:id])

    respond_to do |format|
      # Update news
      # Case 1: News updated
      if @news.update_attributes(params[:news])
        # Redirect the user to the news details (show) page
        # Display success message
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      # Case 2: News not updated
      else
        # Render the edit news form and display any errors
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  # Delete News
  def destroy
    # Find news in DB
    @news = News.find(params[:id])
    # Delete news
    @news.destroy

    respond_to do |format|
      # Redirect the user to the news index page
      format.html { redirect_to news_index_url }
      format.json { head :no_content }
    end
  end

  # Redirect current user to the news index page unless the user is an admin
  def admin_user
    redirect_to(news_index_path) unless is_admin?
  end
end


