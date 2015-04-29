class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :structure
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
