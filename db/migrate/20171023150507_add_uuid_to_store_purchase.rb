class AddUuidToStorePurchase < ActiveRecord::Migration
  def change
    add_column :store_purchases, :uuid, :string
  end
end
