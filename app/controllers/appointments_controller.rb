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

  def destroy
    @appointment = current_user.appointments.find(params[:id])
    if @appointment.destroy
        redirect_to :back, notice: "You deleted that appointment."
    else
        redirect_to :back, notice: "Error. Try again."
    end
  end


  def dashboard
    @properties = current_user.properties
    @appointments = current_user.appointments
    @slots = Slot.appointment.current_user
  end
end