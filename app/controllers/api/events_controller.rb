class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_access_control_headers
  
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end
  
  def preflight
    head 200
  end
  
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
    registered_application = RegisteredApplication.find_by(url: request.env['HTTP_ORIGIN'])
    if registered_application == nil
      render json: "Unregistered Application", status: :unprocessable_entity
    else
      @event = Event.new
      @event.registered_application = registered_application
      @event.event_name = params[:event][:event_name]
    end
  
    
    if @event.save
      render json: @event, status: :created
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
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
