class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all.order ("created_at desc")
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project, notice: "Nice, project has been saved"
    else
      render 'new'
    end
  end

  def store
      # upload image to cloudinary
      @image = Cloudinary::Uploader.upload(params[:media])
      # create a new post object and save to db
      @project = Project.new({:title => params[:title]})
      @project.save
      # trigger an event with pusher
      redirect_to('/')
  end


  def show
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to @project, notice: "Nice, project has been updated"
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.friendly.find(params[:id])
  end


  def project_params
    params.require(:project).permit(:title, :description, :link, :slug)
  end

end
