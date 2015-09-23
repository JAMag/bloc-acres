class AppointmentsController < ApplicationController
  def index
  end

  def about
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