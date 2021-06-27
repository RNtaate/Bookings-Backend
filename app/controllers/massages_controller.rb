class MassagesController < ApplicationController

  def index
    @massages = Massage.all.order("name ASC");
    render json: @massages
  end

  def show
    @massage = Massage.find(params[:id]);

    if @massage
      render json: @massage
    else
      render json: {
        status: 401
      }
    end
  end

  def create
    @massage = Massage.new(massage_params)
    if @massage.save
      render json: {
        status: :created,
        massage: @massage
      }
    else
      render json: {
        status: 401,
        errors: @massage.errors
      }
    end
  end

  private

  def massage_params
    params.permit(:name, :description, :price, :duration, :massage_image)
  end
end