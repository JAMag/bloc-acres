class AddShowcaseToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :showcase, :boolean
  end
end
