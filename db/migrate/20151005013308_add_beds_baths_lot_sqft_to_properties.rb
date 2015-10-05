class AddBedsBathsLotSqftToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :beds, :integer
    add_column :properties, :baths, :integer
    add_column :properties, :lot, :integer
    add_column :properties, :sqft, :integer
  end
end
