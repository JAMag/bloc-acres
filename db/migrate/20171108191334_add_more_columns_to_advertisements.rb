class AddMoreColumnsToAdvertisements < ActiveRecord::Migration
  def change
    change_table :advertisements do |t|
      t.string     "profession"
      t.string   "Name"
      t.integer  "zip"
      t.integer  "contact_info"
      t.boolean  "vouch"
    end

  end
end
