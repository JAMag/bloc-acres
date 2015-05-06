class AppointmentsController < ApplicationController
  def index
  end

  def about
  end

  def create
    @appt = Appointment.new(slot_id: params[:slot_id], user: current_user)
  end

  def dashboard
    @properties = current_user.properties
    @appointments = current_user.appointments
  end
end