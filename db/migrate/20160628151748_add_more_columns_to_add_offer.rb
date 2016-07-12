class AddMoreColumnsToAddOffer < ActiveRecord::Migration
  def change
    add_column :add_offers, :percentage_financing, :integer
    add_column :add_offers, :escrow_agent, :string
    add_column :add_offers, :foundation_rating, :integer
    add_column :add_offers, :garage_rating, :integer
    add_column :add_offers, :windows_rating, :integer
    add_column :add_offers, :plumbing_rating, :integer
    add_column :add_offers, :furnace_rating, :integer
    add_column :add_offers, :roof_rating, :integer
    add_column :add_offers, :electric_rating, :integer
    add_column :add_offers, :basement_rating, :integer
    add_column :add_offers, :kitchen_rating, :integer
    add_column :add_offers, :bathroom_rating, :integer
    add_column :add_offers, :buyer_names, :string
    add_column :add_offers, :buyer_address, :string
    add_column :add_offers, :seller_names, :string
    add_column :add_offers, :seller_address, :string
    add_column :add_offers, :property_address, :string
    add_column :add_offers, :pns_deposit, :integer
    add_column :add_offers, :closing_date, :timestamp
    add_column :add_offers, :mortgage_application_date, :timestamp
    add_column :add_offers, :mortgage_written_commitment_date, :timestamp
    add_column :add_offers, :inspection_date, :timestamp
    add_column :add_offers, :signing_date, :timestamp
    add_column :add_offers, :additional_terms, :text
  end
end
