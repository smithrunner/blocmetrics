class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new
    @event.event_name = params[:event][:event_name]
    @event.registered_application = RegisteredApplication.find(params[:id])
    
    if @event.save
      flash[:notice] = "Event has been added."
      redirect_to [@event]
    else
      flash.now[:alert]  = "There was an error registering the event. Please try again."
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    @event.event_name = params[:event][:event_name]
    @event.registered_application = RegisteredApplication.find(params[:id])
    
    if @event.save
      flash[:notice] = "Event has been added."
      redirect_to [@event]
    else
      flash.now[:alert]  = "There was an error registering the event. Please try again."
      render :new
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    
    if @event.destroy
      flash[:notice] = "\"#{@event.event_name}\" was deleted successfully."
      redirect_to welcome_index_path
    else
      flash.now[:alert] = "There was an error deleting the post."
    end
  end
end
