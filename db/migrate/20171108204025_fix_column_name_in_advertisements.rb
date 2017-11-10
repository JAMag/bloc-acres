class FixColumnNameInAdvertisements < ActiveRecord::Migration
  def change
    rename_column :advertisements, :Name, :advert_name
  end
end
