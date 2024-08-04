class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update, :destroy]
  
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  rescue => e
    logger.error "Error creating user: #{e.message}"
    render json: { error: "Internal Server Error" }, status: :internal_server_error
  end

  def show
    render json: current_user
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
