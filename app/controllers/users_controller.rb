# app/controllers/users_controller.rb

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

class UsersController < ApplicationController
  before_filter :authenticate
  before_filter :new_user,       only: [:new, :create]
  before_filter :signed_in_user, only: [:index, :edit, :update, :change_password, :validate_pwd_change]
  before_filter :correct_user,   only: [:edit, :update, :change_password, :validate_pwd_change]
  before_filter :can_destroy,    only: [:destroy]
  before_filter :all_users,      only: [:index]

  # GET /users
  # GET /users.json
  # Display all users
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  # Display a specific user
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  # Create a new user (form)
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  # Edit an existing user (form)
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  # Create a new user (process request)
  def create
    # Find user based on specified e-mail from request
    @user = User.where("email = ?", params[:user][:email])
    # Check if the user exists
    if @user.exists?
       # Inform the user that the e-mail is already taken
       respond_to do |format|
          format.html { redirect_to root_url, notice: 'Sorry that email already exists, please try another.' }
          format.json { head :no_content }
      end
    # User does not exist
    else
      # Create a new user
      @user = User.new(params[:user])
      respond_to do |format|
        # Save the user to the DB: Successful
        if @user.save
          format.html { redirect_to root_url, notice: 'An email has been sent please enter the code.' }
          format.json { render json: @user, status: :created, location: @user }
          # Send e-mail to user containing account confirmation code
          UserMailer.reg_confirmation(@user).deliver
        # Save unsuccessful  
        else
          # Redisplay create new user form with relevant errors
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  # Update an existing user
  def update
    # Find user based on specified id
    @user = User.find(params[:id])
    
    # User authentication
    # Incorrect password
    if(!@user.authenticate(params[:user][:password]))
         respond_to do |format|
           flash[:notice] = 'Incorrect Password'
           format.html { render action: "edit" }
           format.json { head :no_content }
         end
    # Correct password
    else
      respond_to do |format|
        # Update user's information successful
        if @user.update_attributes(params[:user])
           # Sign the user in again to establish a new session
           sign_in @user
           format.html { redirect_to @user, notice: 'User was successfully updated.' }
           format.json { head :no_content }
        # Update user unsuccessful
        else
           # Redisplay the edit user form with relevant errors
           format.html { render action: "edit" }
           format.json { render json: @user.errors, status: :unprocessable_entity }
         end
       end
     end
  end

  # Display the change password form
  def change_password
       @user = User.find(params[:id])
       render 'change_pwd'
  end

  # Validate password change
  def validate_pwd_change
        @user = User.find(params[:id])
        
         # User authentication
         # Incorrect password
         if(!@user.authenticate(params[:user][:curr_password]))
           respond_to do |format|
             format.html { redirect_to change_pwd_path, notice: 'Incorrect password'}
             format.json { head :no_content }
           end
        # Correct current password
        else
          respond_to do |format|
             # Update user with new password
             if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
                 # Sign the user in again to establish a new session
                 sign_in @user
                 format.html { redirect_to @user, notice: 'Password has been changed' }
                 format.json { head :no_content }
             else
                format.html { render action: "change_pwd" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
             end
           end
         end
  end

  # Confirm user's account (form)
  def confirm_user
      render 'confirm'
    
  end

  # Verify user's confirm code
  def check_confirm_code
      @user = User.find(params[:id])
 
       # Confirm Code matches
       if(@user.confirm_code == params[:code] && !@user.confirmed)
          # Set user status to confirmed
          @user.update_attribute(:confirmed, true)
          # Sign the user in     
          sign_in @user
          respond_to do |format|
            format.html { redirect_to @user, notice: 'Thank you for validating your account' }
            format.json { head :no_content }
         end
       # Confirm code does not match
       else
         respond_to do |format|
           format.html { redirect_to confirm_signup_url, notice: 'Code was incorrect' }
           format.json { head :no_content }

         end
       end
  end 

  def userItems
    # Find the current user's items
    @inventory = Item.where(:user_id => params[:id])
    @user = User.find(params[:id])    
   
    @items = @inventory.page(params[:page]).per(9)
    
    respond_to do |format|
      format.js
      format.html # userItems.html.erb
      format.json { render json: @items}
    end
  end



  # DELETE /users/1
  # DELETE /users/1.json
  # Delete a specific user
  def destroy
    @user = User.find(params[:id])

    # Sign the user out if the current user is requesting to delete their own account
    if current_user?(@user)
       sign_out
    end

    # Delete all flags owned by the user
    Flag.destroy_all(:user_id => params[:id])
    # Delete user
    @user.destroy

    

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  def numberOfUsers
  end

  private

    # Check if the requested user is the same as the current user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    # Check if the user has the permission to delete the requested user
    def can_destroy
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user) || current_user.admin?
    end

    def all_users
      redirect_to(root_path) unless current_user.admin?
    end

end
