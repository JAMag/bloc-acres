class AddLockitronIdToLocks < ActiveRecord::Migration
  def change
    add_column :locks, :lockitron_id, :string
  end
end
