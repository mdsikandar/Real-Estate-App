class AddNullToUsers < ActiveRecord::Migration[5.0]
  def change
  	change_column_null :properties, :user_id,false
  	change_column_null :properties, :property_type,false
  	add_index :properties, :property_type, unique: true
  end
end
