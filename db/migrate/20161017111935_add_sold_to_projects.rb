class AddSoldToProjects < ActiveRecord::Migration[5.0]
  def change
	add_column :projects, :sold, :string
  end
end
