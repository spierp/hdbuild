class AddGeocodingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :longitude, :float
    add_column :projects, :latitude, :float
  end
end
