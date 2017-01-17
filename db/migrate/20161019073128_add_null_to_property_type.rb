class AddNullToPropertyType < ActiveRecord::Migration[5.0]
  def up
  	change_column_null(:properties, :name,false)
  end
end
