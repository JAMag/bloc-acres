class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :property, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :properties
    add_foreign_key :comments, :users
  end
end
