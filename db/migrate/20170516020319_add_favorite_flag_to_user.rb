class AddFavoriteFlagToUser < ActiveRecord::Migration
  def change
    add_column(:users, :progress_has_favorited, :boolean)
  end
end
