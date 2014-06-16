class AddMayorIdToTown < ActiveRecord::Migration
  def change
    add_column :towns, :mayor_id, :integer
  end
end
