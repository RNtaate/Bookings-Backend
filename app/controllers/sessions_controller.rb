class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    user = User.find_by(username: session_username_params).try(:authenticate, session_password_params)

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }, status: :created
    else
      render json: {
        status: 403,
        error: 'Username and/or Password is incorrect'
      }, status: 403
    end
  end

  def show
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def destroy
    reset_session
    render json: {
      status: 200,
      logged_out: true
    }, status: 200
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end

  def session_username_params
    session_params['username']
  end

  def session_password_params
    session_params['password']
  end
end
