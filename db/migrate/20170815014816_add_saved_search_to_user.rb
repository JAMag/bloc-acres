class AddSavedSearchToUser < ActiveRecord::Migration
  def change
    add_column(:users, :saved_search, :string)
  end
end
