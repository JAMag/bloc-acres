class AddOffer < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  attr_accessor :purchase_price, :escrow_agent, :offer_date, :offer_duration_date, :read_date, :submitted_date, :closing_date, :pns_signing_date, :accept_reject_date, :deposit_receipt,

def create
  @property = Property.find(params[:property_id])
  @add_offer = @property.add_offers.create(add_offers_params)
  redirect_to @add_offer
end


def offer
  @offer = Offer.new
  @property = Offer.Property.new
end

end


