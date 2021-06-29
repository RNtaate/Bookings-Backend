class RegistrationsController < ApplicationController
  def create
    user = User.new(username: params['user']['username'], password: params['user']['password'],
                    password_confirmation: params['user']['password_confirmation'])

    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: {
        status: 500,
        errors: user.errors
      }
    end
  end
end
