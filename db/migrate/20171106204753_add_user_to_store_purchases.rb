class AddUserToStorePurchases < ActiveRecord::Migration
  def change
    add_reference :store_purchases, :user, index: true
    add_foreign_key :store_purchases, :users
  end
end
