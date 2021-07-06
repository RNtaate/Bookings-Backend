class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }, status: :created
    else
      render json: {
        status: 422,
        errors: user.errors
      }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
