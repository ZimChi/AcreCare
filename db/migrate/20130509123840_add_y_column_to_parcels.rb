class AddYColumnToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :y, :float
  end
end
