class CreateMayors < ActiveRecord::Migration
  def change
    create_table :mayors do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
