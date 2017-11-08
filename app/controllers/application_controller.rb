class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  
  # curl -v -H "Accept: application/json" -H "Origin: http://hettinger.org/eladio" -H "Content-Type: application/json" -X POST -d '{"event_name":"foobar"}' https://blocmetrics-smithrunner.c9users.io/api/events
end
