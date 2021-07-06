class AppointmentsController < ApplicationController
  include CurrentUserConcern

  def index
    @appointments = Appointment.my_appointments(@current_user).ascending_date

    render json: @appointments
  end

  def create
    @appointment = @current_user.appointments.build(appointment_params)

    if @appointment.save
      render json: {
        status: :created,
        appointment: @appointment
      }, status: :created
    else
      render json: {
        status: 422,
        errors: @appointment.errors
      }, status: 422
    end
  end

  def destroy
    @appointments = Appointment.my_appointments(@current_user)
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    render json: @appointments
  end

  private

  def appointment_params
    params.permit(:customer_name, :massage_type, :massage_id, :date, :city)
  end
end
