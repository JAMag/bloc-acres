class AddPropAffordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prop_afford, :integer
    add_column :users, :yearly_salary, :integer
    add_column :users, :monthly_debt, :integer
  end
end
