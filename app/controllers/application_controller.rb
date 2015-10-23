class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session
  
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "landing"
    else
      "application"
    end
  end  
end
