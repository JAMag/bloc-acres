class CreateAddOffers < ActiveRecord::Migration
  def change
    create_table :add_offers do |t|
      t.integer :offer_price, :accepted_price, :deposit
      t.time :offer_duration, :signed_pns, :submitted, :read, :accept_reject
      t.timestamps null: false
    end
  end
end
