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

    flash[:notice] = "Thanks for using Bloc-Acres, #{current_user.email}!"
    redirect_to dashboard_path

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