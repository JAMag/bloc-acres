class ChargesController < ApplicationController

  def create
    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: 10_00,
        description: "Viewing",
        currency: 'usd'
    )



    @appointment = Appointment.new(slot_id: params[:slot_id], user: current_user)
    @property = Property.find(params[:property_id])
    if @appointment.save
      UserMailer.appointment_email(@user).deliver
      flash[:notice] = "Created appointment to visit this house."
      redirect_to @property
    else
      flash[:error] = "Error creating appointment to visit this house. Please try again."
      redirect_to @property
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

  end

  def new
    @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Viewing- #{current_user.name}",
        amount: 10_00
    }
  end

end