class SessionsController < ApplicationController
  def create
    user = User.find_by_email(user_params[:email])

    if user&.authenticate(user_params[:password])
      token = issue_token(user)
      render json: { user:, jwt: token, status: :success }
    else
      render json: { error: 'Incorrect username or password.', status: :failed }
    end
  end

  # GET /users/1
  def show
    if logged_in?
      render json: { user: current_user, status: :success }
    else
      render json: { error: 'Please log in', status: :failed }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
