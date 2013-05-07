class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.string :title
      t.string :icon
      t.string :description

      t.timestamps
    end
  end
end
