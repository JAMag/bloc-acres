class AppointmentsController < ApplicationController


  def index
  end

  def about
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update_attributes(appointment_params)
      redirect_to :back, notice: "You started appointment."
    else
      redirect_to :back, notice: "Error. Try again."
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
    @slots = Slot.appointment.current_user # current_user.slots
  end

  def show
    @property = Property.find(params[:property_id])
    @slot = Slot.find(params[:slot_id])
    @appointment = Appointment.find(params[:id])
  end

  def new

  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def unlock
    #check that current_user is correct user
    @appointment = Appointment.find(params[:appointment_id])
    @lock = @appointment.slot.property.lock
    response = @lock.unlock(slot)

    message=check_time_and_location(@appointment)
    if message
      redirect_to @appointment, notice: message
    else
      response = @lock.unlock
      redirect_to @appointment, notice: response
    end
  end

  def lock
    @appointment = Appointment.find(params[:appointment_id])
    @lock = @appointment.slot.property.lock

    message=check_time_and_location(@appointment)
    if message
      redirect_to @appointment, notice: message
    else
      response = @lock.lock
      redirect_to @appointment, notice: response
    end


  end


  private
  def check_time_and_location(appointment)
    message = ""

    message = "Appt hasn't started" if appointment.slot.start_time > Time.now
    message = "Apt is in teh past" if appointment.slot.start_time + 30.minutes < Time.now
    #current_user.location == slot.property.address

    message
  end

  def appointment_params
    params.require(:appointment).permit(:avatar)
  end


end