class RenameCoordinates < ActiveRecord::Migration
  def up
    rename_column :parcels, :x, :latitude
    rename_column :parcels, :y, :longitude
  end

  def down
    rename_column :parcels, :latitude, :x
    rename_column :parcels, :longitude, :y
  end
end
