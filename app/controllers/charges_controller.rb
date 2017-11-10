class ChargesController < ApplicationController

  def store_purchase
    @total = 0
    cart.each do |product_id, count|
      @product = Product.find(product_id)
      @description = @product.description
      @purchase = @product.price * count
      @total +=  @purchase
    end

    customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @total,
        description: "Store Description",
        currency: 'usd'
    )
    #
    # # Attempt to fix store purchases and store in Database
    # store_purchase = StorePurchase.create(email: params[:stripeEmail], card: params[:stripeToken], amount: params[:amount],
    #                                       customer_id: customer.id, product_id:1, uuid: SecureRandom.uuid)
    # redirect_to store_purchase
    # # end of store purchase

    #
    # count the number of products each
    # multiply product price by number of products
    # add all
    #
    @store_purchase = StorePurchase.new(amount: @total, user: current_user, description: @description, uuid: SecureRandom.uuid )

    if @store_purchase.save
      # UserMailer.appointment_email(@user).deliver
      # session[:cart] = nil
      flash[:notice] = "Created store purchase."
      redirect_to :back
      session[:cart] = nil
    else
      flash[:error] = "Error creating store purchase. Please try again."
      redirect_to :back
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to dashboard_path
  end


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

    # # Attempt to fix store purchases and store in Database
    # store_purchase = StorePurchase.create(email: params[:stripeEmail], card: params[:stripeToken], amount: params[:amount],
    #                                       customer_id: customer.id, product_id:1, uuid: SecureRandom.uuid)
    # redirect_to store_purchase
    # # end of store purchase


    @appointment = Appointment.new(slot_id: params[:slot_id], user: current_user)
    @property = Property.friendly.find(params[:property_id])
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