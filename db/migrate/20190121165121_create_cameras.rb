class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :position
      t.string :ngrok_address
      t.string :ngrok_password
      t.decimal :price
      t.integer :house_id
      t.integer :user_id
      t.integer :battery_life
      t.boolean :battery
      t.boolean :wired
      t.boolean :powered
      t.boolean :recording
      t.references :property, index: true

      t.timestamps null: false
    end
    add_foreign_key :cameras, :properties
  end
end
