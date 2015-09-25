class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.references :user, index: true
      t.references :slot, index: true

      t.timestamps null: false
    end
    add_foreign_key :appointments, :users
    add_foreign_key :appointments, :slots
  end
end
