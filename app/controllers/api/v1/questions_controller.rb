class Api::V1::QuestionsController < Api::BaseController
  def show
    question = current_user.questions.order(created_at: :desc).first

    if question.present?
      render json: Api::Response.build(true, current_user, question: question, answers: question.answers.order(position: :asc)), status: 200
    else
      render json: Api::Response.build(false, current_user, errors: "No available questions."), status: 404
    end
  end
end
