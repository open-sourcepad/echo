class Api::V1::UsersController < Api::BaseController
  skip_before_action :authenticate_user_from_token!, only: [:sign_in, :sign_up]

  def sign_in
    @user = User.find_for_database_authentication(user_params)

    if @user && @user.valid_password?(params[:password])
      sign_in @user, store: false
    else
      invalid_login_attempt
    end
  end

  def sign_up
    return if User.find(email: user_params[:email]).presence

    @user = User.new(email: user_params[:email], password: user_params[:password], password_confirmation: user_params[:password])

    if @user.save
      sign_in @user, store: false
      render json: Api::Response.build(true, user), status: 200
    else
      render json: Api::Response.build(false, errors: user.errors.messages), status: 200
    end
  end

  def sign_out
    @user = User.find_for_database_authentication(user_params)

    if @user && @user.valid_password?(params[:password])
      sign_out @user
      render json: Api::Response.build(true, message: 'Logged out user.'), status: 200
    else
      render json: Api::Response.build(false, @user, message: 'Wrong password.'), status: 200
    end
  end

  private

  def invalid_login_attempt
    # Make sure warden won't do anything
    warden.custom_failure!

    render json: Api::Response.build(false, message: 'Error with your email or password', error_code: "1001"), status: 200
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
