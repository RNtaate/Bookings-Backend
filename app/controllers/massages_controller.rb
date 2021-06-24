class MassagesController < ApplicationController

  def index
    @massages = Massage.all
    render json: @massages
  end

  def create
    @massage = Massage.create(massage_params)
    if @massage
      render json: {
        status: :created,
        massage: @massage
      }
    else
      render json: {
        status: 401
      }
    end
  end

  private

  def massage_params
    params.permit(:name, :description, :price, :duration, :massage_image)
  end
end