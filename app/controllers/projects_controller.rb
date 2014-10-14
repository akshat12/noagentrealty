# app/controllers/projects_controller.rb

class ProjectsController < ApplicationController
  before_filter :authenticate
  before_filter :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :can_destroy, only: [:destroy]

  # GET /projects
  # GET /projects.json
  # Display all projects
  def index
    @projects = Project.all
    @projects.sort!{|a,b| b.created_at <=> a.created_at}
    
    @items = Kaminari.paginate_array(@projects).page(params[:page]).per(1)
    
    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  # Display a specific project
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  # Create a new project (form)
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  # Edit an existing project (form)
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  # Create a new project (process request)
  def create
    @user = current_user
    @project = @user.projects.build(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  # Update an existing project
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  # Delete a project
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private

    # Check if the current user is the owner of the requested project
    def correct_user
      @project = Project.find(params[:id])
      redirect_to(projects_path) unless current_user?(@project.user)
    end

    # Check if the current user has permission to delete the requested project
    def can_destroy
      @project = Project.find(params[:id])
      redirect_to(projects_path) unless current_user?(@project.user) || current_user.admin?
    end
end
