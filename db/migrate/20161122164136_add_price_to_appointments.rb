class AddPriceToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :price, :integer
  end
end
