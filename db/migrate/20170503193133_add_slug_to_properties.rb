class AddSlugToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :slug, :string
  end
end
