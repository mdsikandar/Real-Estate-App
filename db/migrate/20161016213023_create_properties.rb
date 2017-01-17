class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :name
      t.string :property_type
      t.timestamps
    end

    add_column :projects, :property_id, :integer
    add_foreign_key :projects, :properties
  end
end
