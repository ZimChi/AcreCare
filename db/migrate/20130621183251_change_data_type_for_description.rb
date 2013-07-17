class ChangeDataTypeForDescription < ActiveRecord::Migration
  def up
    change_column :parcels, :description, :text
  end

  def down
    change_column :parcels, :description, :string
  end
end
