class AddPropertyIdToAddOffer < ActiveRecord::Migration
  def change
    add_reference :add_offers, :property
  end
end
