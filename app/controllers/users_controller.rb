class UsersController < ApplicationController
  before_action :set_user, only: %i[update destroy]

  # GET /users
  def index
    users = User.all

    render json: users
  end

  # POST /users
  def create
    user = User.new(user_params)

    if user.save
      token = issue_token(user)
      render json: { user:, jwt: token, success: "Welcome, #{user.username}!", status: :created }
    elsif user.errors.messages
      render json: { error: user.errors.messages, status: :failed }
    else
      render json: { error: 'User could not be created. Please try again.', status: :failed }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    render json: { success: 'Account deleted successfully.', status: :success } if @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
