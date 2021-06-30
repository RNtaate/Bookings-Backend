class WelcomeController < ApplicationController

  def index
    render json: {status: "Welcome to the Norp Massage Parlor Api"}
  end

end