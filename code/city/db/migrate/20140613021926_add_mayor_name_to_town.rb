class AddMayorNameToTown < ActiveRecord::Migration
  def change
    add_column :towns, :mayor_name, :string
  end
end
