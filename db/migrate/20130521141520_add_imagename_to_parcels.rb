class AddImagenameToParcels < ActiveRecord::Migration
  def change
    add_column :parcels, :imagename, :string
  end
end
