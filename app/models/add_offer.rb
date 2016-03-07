class AddOffer < ActiveRecord::Base
  belongs_to :user
  has_one :property, dependent: :destroy


  attr_accessor :purchase_price, :escrow_agent, :offer_date, :offer_duration_date, :read_date, :submitted_date, :closing_date, :pns_signing_date, :accept_reject_date, :deposit_reciept,


def offer
  @offer = Offer.new
  @property = Offer.Property.new
end

end


