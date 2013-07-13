class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

class ProjectsController < ApplicationController
  def index
  end

  private
    def find_project
      before_filter :find_project, :only => [:show,
                                            :edit,
                                            :update,
                                            :destroy]
     rescue ActiveRecord::RecordNotFound
     flash[:alert] = "The project you were looking" +
      " for could not be found."
      redirect_to projects_path
   end
end
