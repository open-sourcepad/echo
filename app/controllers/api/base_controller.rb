class Api::BaseController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_user_from_token!
  after_action :set_csrf_headers, only: [:create, :update, :destroy]

  respond_to :json

  rescue_from ActionController::ParameterMissing, with: :missing_parameters

  def authenticate_user_from_token!
    uid = params[:uid].presence
    user = uid && User.find_by(id: uid)

    if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
      sign_in user, store: false
      render json: Api::Response.build(true, user), status: 200
    else
      render json: Api::Response.build(false, message: "error with your uid or auth_token"), status: 401
    end
  end

  private

  def missing_parameters(exception)
    render json: Api::Response.build(false, message: exception.to_s), status: 400
  end

  protected

  def set_csrf_headers
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
end
