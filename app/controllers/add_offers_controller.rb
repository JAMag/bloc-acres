class AddOffersController < ApplicationController




  def create
    @add_offer = AddOffer.new(add_offer_params)



    if @add_offer.save
      redirect_to :back, notice: "Created Offer."
    else
      redirect_to :back, notice: "Please try to create offer again."
    end
  end



  def add_offer_params
    params[:add_offer].permit(:percentage_financing, :escrow_agent, :foundation_rating, :garage_rating, :windows_rating, :plumbing_rating, :furnace_rating, :roof_rating, :electric_rating, :basement_rating, :kitchen_rating, :bathroom_rating, :buyer_names, :buyer_address, :seller_names, :seller_address, :property_address, :pns_deposit, :closing_date, :mortgage_application_date, :mortgage_written_commitment_date, :inspection_date, :signing_date, :additional_terms)
  end

end



