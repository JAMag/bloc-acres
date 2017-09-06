class SubscribersController < ApplicationController

  before_filter :authenticate_user!

  def new

  end

  def update
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
                                   card: token,
                                   plan: "platinum_plan",
                                   email: current_user.email
    )
    current_user.subscribed = true
    current_user.stripeid = customer.id
    current_user.save
    redirect_to dashboard_path,  notice: "You've been subscribed to the platinum plan."
  end
end

