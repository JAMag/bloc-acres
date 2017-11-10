class ChangeZipInAdvertisements < ActiveRecord::Migration
  def change
    change_column :advertisements, :zip, :string
  end
end

