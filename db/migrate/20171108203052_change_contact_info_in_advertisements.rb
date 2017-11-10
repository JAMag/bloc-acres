class ChangeContactInfoInAdvertisements < ActiveRecord::Migration
  def change
    change_column :advertisements, :contact_info, :string
  end
end
