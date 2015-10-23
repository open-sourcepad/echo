class QuestionsController < ApplicationController

  before_action :set_question, only: [:index, :create, :add_answer]
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
    2.times {@question.answers.build}
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      @question.set_active if current_user.questions.empty?
      current_user.questions << @question
      redirect_to questions_url
    end
  end

  def update
    if @question.update_attributes(question_params)
    end
  end

  def add_answer
    @answer = @question.answers.build
  end

  def remove_answer
    @answer = Answer.find(params[:id])
  end

  private

    def set_question
      if Question.first.present?
        @question = Question.first
      else
        @question = Question.new
        2.times { @question.answers.build }
      end
    end

    def question_params
      params.require(:question).permit(:description, answers_attributes:[:description, :image])
    end

end
