class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.date_time :start_time
      t.references :property, index: true
      

      t.timestamps null: false
    end
    add_foreign_key :slots, :properties
  end
end
