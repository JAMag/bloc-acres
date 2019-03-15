class CreateSchoolDistricts < ActiveRecord::Migration
  def change
    create_table :school_districts do |t|
      t.string :name
      t.integer :special_id
      t.integer :special_id2
      t.integer :zip

      t.timestamps null: false
    end
  end
end
