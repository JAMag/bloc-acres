class AddAvatarToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :avatar, :string
  end
end
