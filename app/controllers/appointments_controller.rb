class AppointmentsController < ApplicationController
  include CurrentUserConcern

  def index
    @appointments = Appointment.where(user_id: @current_user.id).includes(:massage).order('date ASC')

    render json: @appointments
  end

  def create
    @appointment = @current_user.appointments.build(appointment_params)

    if @appointment.save
      render json: {
        status: :created,
        appointment: @appointment
      }
    else
      render json: {
        status: 401,
        errors: @appointment.errors
      }
    end
  end

  def destroy
    @appointments = Appointment.where(user_id: @current_user.id).includes(:massage)
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    render json: @appointments
  end

  private

  def appointment_params
    params.permit(:customer_name, :massage_type, :massage_id, :date, :city)
  end
end
