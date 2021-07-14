class MassagesController < ApplicationController
  include CurrentUserConcern

  def index
    @massages = Massage.ascending_order
    render json: @massages
  end

  def show
    @massage = Massage.find(params[:id])

    if @massage
      render json: @massage
    else
      render json: {
        status: 404
      }, status: 404
    end
  end

  def create
    return if @current_user.id != 1

    @massage = Massage.new(massage_params)
    if @massage.save
      render json: @massage, status: :created
    else
      render json: {
        status: 422,
        errors: @massage.errors
      }, status: 422
    end
  end

  private

  def massage_params
    params.permit(:name, :description, :price, :duration, :massage_image)
  end
end
