class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
	def index
    @projects = Project.all
    if params[:search]
      @projects = Project.search(params[:search]).order("created_at DESC")
    else
      @projects = Project.all.order('created_at DESC')
    end
  end
  def show
    @project = Project.find(params[:id])
  end
	def new
		 @project = current_user.projects.build
		 @properties= Property.pluck(:name, :id )
	end
	def edit
  		@project = Project.find(params[:id])
  		@properties= Property.pluck(:name, :id)
	end
	def create
  		@project = current_user.projects.build(project_params)
      @project.property_id = params[:property_id] 
      @properties= Property.pluck(:name, :id)
    if @project.save  
      redirect_to @project
    else
      render :new
    end
	end
  def update
    @project = Project.find(params[:id])
    @project.property_id = params[:property_id] 
    @properties= Property.pluck(:name, :id)
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit
    end
  end
  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to projects_path, notice: "Successfully destroyed"
    else
      redirect_to @project, notice: "Not destroyed"
    end
  end
  def send_order_mail
     @project = Project.find(params[:id])
     ProjectMailer.sample_email(current_user, @project.user).deliver
      flash[:notice] = "mail has been sent."
      redirect_to project_path(@project.id)
  end
  private
    def project_params
    params.require(:project).permit(:property_id,:location,:price,:area,:developer_name,:sold,:image,:delete_image)
  end
end

