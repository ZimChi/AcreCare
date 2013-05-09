class AddXColumnToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :x, :float
  end
end
