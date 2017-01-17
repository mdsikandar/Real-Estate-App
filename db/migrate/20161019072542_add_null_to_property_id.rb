class AddNullToPropertyId < ActiveRecord::Migration[5.0]
  def change
  	change_column_null(:projects, :property_id ,false)
  	change_column_null(:projects, :price ,false)
  	change_column_null(:projects, :area ,false)
  	change_column_null(:projects, :location ,false)
  	change_column_null(:projects, :developer_name,false)

  end
end
