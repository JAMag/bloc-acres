class CreateAddFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :property
      t.timestamps null: false
    end
  end
end
