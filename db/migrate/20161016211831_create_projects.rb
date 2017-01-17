class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :location
      t.integer :price
      t.integer :area
      t.string :developer_name

      t.timestamps
    end
  end
end
