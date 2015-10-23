class Api::V1::FeedbackController < Api::BaseController
  skip_before_action :authenticate_user_from_token!
  before_action :find_answer

  def create
    Feedback.create(answer_id: @answer.id, question_id: @answer.question_id)
    render json: Api::Response.build(true, message: "Thank you!"), status: 200
  end

  private

  def find_answer
    @answer = Answer.find_by(id: params[:answer_id]).presence

    unless @answer
      render json: Api::Response.build(false, message: "Answer is not in the list."), status: 400
    end
  end
end
