class AppointmentsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!, :only => 'reply'
  require 'Base64'

  def index
  end

  def about
  end


  # Split up a data uri
  def split_base64(uri_str)
    if uri_str.match(%r{^data:(.*?);(.*?),(.*)$})
      uri = Hash.new
      uri[:type] = $1 # "image/gif"
      uri[:encoder] = $2 # "base64"
      uri[:data] = $3 # data string
      uri[:extension] = $1.split('/')[1] # "gif"
      return uri
    else
      return nil
    end
  end

  # Convert data uri to uploaded file. Expects object hash, eg: params[:post]
  def convert_data_uri_to_upload(data_uri)
    byebug
    if !data_uri.blank?
      image_data = split_base64(data_uri)
      image_data_string = image_data[:data]
      image_data_binary = Base64.decode64(image_data_string)

      temp_img_file = Tempfile.new("data_uri-upload")
      temp_img_file.binmode
      temp_img_file << image_data_binary
      temp_img_file.rewind
      byebug
      img_params = {:filename => "data-uri-img.#{image_data[:extension]}", :type => image_data[:type], :tempfile => temp_img_file}
      uploaded_file = ActionDispatch::Http::UploadedFile.new(img_params)

      return uploaded_file
    end

    return nil
  end


  def update
    @appointment = Appointment.find(params[:id])
    @user = @appointment.user


    if @appointment.update_attributes(appointment_params)


      # boot_twilio
      # sms = @client.messages.create(
      #     from: Rails.application.secrets.twilio_number,
      #     to: @user.phone_number,
      #     body: "You've started your viewing. Thank you for using Moverable. "
      # )

      redirect_to :back, notice: "You started appointment."

    else
      redirect_to :back, notice: @appointment.errors.full_messages.join(", ")
    end
  end

  def add_avatar
    @appointment = Appointment.find(params[:appointment_id])
    @user = @appointment.user


    @appointment.avatar = convert_data_uri_to_upload(appointment_params[:avatar])
    if @appointment.save


      # boot_twilio
      # sms = @client.messages.create(
      #     from: Rails.application.secrets.twilio_number,
      #     to: @user.phone_number,
      #     body: "You've started your viewing. Thank you for using Moverable. "
      # )

      redirect_to :back, notice: "You started appointment."

    else
      redirect_to :back, notice: @appointment.errors.full_messages.join(", ")
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
    @property = Property.friendly.find(params[:property_id])
    @slot = Slot.find(params[:slot_id])
    @appointment = Appointment.find(params[:id])


  end

  def new

    respond_to do |format|
      format.js
    end

  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def unlock
    #check that current_user is correct user
    @appointment = Appointment.find(params[:appointment_id])
    @lock = @appointment.slot.property.lock
    #response = @lock.unlock(slot)

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

  def boot_twilio
    @client = Twilio::REST::Client.new(Rails.application.secrets.twilio_sid, Rails.application.secrets.twilio_token)
  end


end