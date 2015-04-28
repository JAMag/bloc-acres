class CreateLocks < ActiveRecord::Migration
  def change
    create_table :locks do |t|
      t.string :model
      t.string :manufacturer
      t.references :property, index: true

      t.timestamps null: false
    end
    add_foreign_key :locks, :properties
  end
end
