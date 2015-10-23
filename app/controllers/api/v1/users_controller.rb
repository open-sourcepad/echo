class Api::V1::UsersController < Api::BaseController
  skip_before_action :authenticate_user_from_token!, only: [:sign_in, :sign_up]

  def sign_in
    @user = User.where('email=?', params[:email]).first

    return authenticate_user_with_email unless @user

    if @user && @user.password == params[:password]
      sign_in @user, store: false
    else
      invalid_login_attempt
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
