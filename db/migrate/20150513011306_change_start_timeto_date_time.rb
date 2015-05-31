class ChangeStartTimetoDateTime < ActiveRecord::Migration
  def change
    change_column :slots, :start_time, :datetime
    change_column :appointments, :start_time, :datetime
  end
end
