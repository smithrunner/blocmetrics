class RegisteredApplicationsController < ApplicationController
  
  def index
    @registered_applications = RegisteredApplication.all
  end
  
  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:event_name)
  end
    
  def new
    @registered_application = RegisteredApplication.new
  end
  
  def create
    @registered_application = RegisteredApplication.new
    @registered_application.name = params[:registered_application][:name]
    @registered_application.URL = params[:registered_application][:URL]
    @registered_application.user = current_user
   
    if @registered_application.save
      flash[:notice] = "Application has been registered."
      redirect_to [@registered_application]
    else
      flash.now[:alert] = "There was an error registering the application. Please try again."
      render :new
    end
  end
    
  def edit
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.name = params[:registered_application][:name]
    @registered_application.URL = params[:registered_application][:URL]
    @registered_application.user = current_user
    
    if @registered_application.save
      flash[:notice] = "Application has been updated."
      redirect_to [@registered_application]
    else
      flash.now[:alert] = "There was an error saving. Please try again."
      render :new
    end
  end
    
  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to welcome_index_path
    else
      flash.now[:alert] = "There was an error deleting the post."
    end
  end
end
