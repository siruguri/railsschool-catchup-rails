class AddCityIdToMayor < ActiveRecord::Migration
  def change
    add_column :mayors, :city_id, :integer
  end
end
