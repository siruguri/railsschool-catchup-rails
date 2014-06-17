class CreateMen < ActiveRecord::Migration
  def change
    create_table :men do |t|
      t.string :name

      t.timestamps
    end
  end
end
