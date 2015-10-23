class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :reset_session
  
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      dashboard_path(resource) || request.referer || root_path
    end
  end

  def after_sign_up_path_for(resource)
    dashboard_path(resource) || request.referer || root_path
  end
  
  protected

  def layout_by_resource
    if devise_controller?
      "landing"
    else
      "application"
    end
  end  
end
