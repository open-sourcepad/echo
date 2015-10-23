class WelcomeController < ApplicationController
  
  def index
    if current_user
      redirect_to summary_path
    else
      render layout: 'landing'
    end
  end

  def summary
    @question = Question.active.first
  end
end
