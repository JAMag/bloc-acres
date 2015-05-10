class AppointmentsController < ApplicationController
  def index
  end

  def about
  end

  def create
    @appointment = Appointment.new(slot_id: params[:slot_id], user: current_user)
    @property = Property.find(params[:property_id])
    if @appointment.save
      flash[:notice] = "Created appointment to visit this house."
      redirect_to @property
    else
      flash[:error] = "Error creating appointment to visit this house. Please try again."
      redirect_to @property
    end
  end

  def dashboard
    @properties = current_user.properties
    @appointments = current_user.appointments
  end
end