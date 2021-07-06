class RegistrationsController < ApplicationController
  def create
    user = User.new(username: params['user']['username'], password: params['user']['password'],
                    password_confirmation: params['user']['password_confirmation'])

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
end
