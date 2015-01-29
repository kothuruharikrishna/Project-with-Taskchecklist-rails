class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  respond_to :html,:js
  
  def index
    if params[:sort].present?
      @projects = Project.where('substr(name,1,1) LIKE ?', "%#{params[:sort]}%") 
    else
      @projects = Project.all
      @project = Project.new
    end
  end

  
  def show
  end

  def new
    @project = Project.new
    respond_to do |format|
      format.html 
      format.js
    end
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @projects = Project.all
    flash[:success] = "Project is Created sucessfully"
    respond_to do |format|
      if @project.save
        format.html 
        format.js
      else
        format.html { render :new }
        format.js 
      end
    end
  end

  def update
    @projects = Project.all
    respond_to do |format|
      if @project.update(project_params)
        flash[:notice] = "Project is Updated sucessfully"
        format.html 
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @projects = Project.all
    @project.destroy
    flash[:notice] = "Project is Destroy sucessfully"
    respond_to do |format|
      format.html{}
      format.js
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name)
    end
end
