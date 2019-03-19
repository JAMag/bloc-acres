class ChangeSlotsToBookable < ActiveRecord::Migration
  def change
    rename_column :slots, :property_id, :bookable_id
    add_column :slots, :bookable_type, :string
    Slot.update_all(bookable_type: 'Property')
  end
end
