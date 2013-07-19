class ProjectsController < ApplicationController
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]
  before_filter :authorize_admin!, :except => [:index, :show]
  validates :name, :presence => true, :uniqueness => true
  has_many :permissions, :as => :thing <co id="ch08_99_1"/>

  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view",
          :user_id => user.id })
  end


  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project]) <co id="ch03_551_1"/>
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project,
      :notice => "Project has been created."
    else
# nothing, yet
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @project.destroy
      flash[:notice] = "Project has been deleted."
      :redirect_to projects_path
  end

  private
    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to root_path
    end
  end

private
  def find_project
    @project = if current_user.admin?
      Project.find(params[:id])
  else
      Project.viewable_by(current_user).find(params[:id])
  end

  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking" +
                    " for could not be found."
    redirect_to projects_path
  end

end
