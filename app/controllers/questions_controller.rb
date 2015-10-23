class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :add_answer, :set_default]
  def index
    @questions = Question.all.order(:created_at)
  end
  
  def new
    @question = Question.new
    2.times {@question.answers.build}
  end

  def show
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

  def set_default
    Question.update_all(active: false)
    @question.set_active
    redirect_to questions_path
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:description, answers_attributes:[:description, :image])
    end

end
