class AddMayorToCity < ActiveRecord::Migration
  def change
    add_column :cities, :mayor_name, :string
  end
end
