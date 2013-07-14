class TicketsController < ApplicationController
  before_filter :find_project
  private
    def find_project
      @project = Project.find(params[:project_id])
    end

    def new
      @ticket = @project.tickets.build
    end
end
