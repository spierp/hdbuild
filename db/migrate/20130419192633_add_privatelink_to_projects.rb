class AddPrivatelinkToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :privatelink, :string
  end
end
