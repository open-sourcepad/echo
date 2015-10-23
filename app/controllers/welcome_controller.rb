class WelcomeController < ApplicationController
  
  def index
    if current_user
      redirect_to dashboard_path
    else
      render layout: 'landing'
    end
  end

  def dashboard

  end
end
