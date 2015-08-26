class AddMultiPhotoToProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :photo
    add_column :properties, :photos, :json
  end
end
