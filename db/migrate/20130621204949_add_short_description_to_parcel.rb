class AddShortDescriptionToParcel < ActiveRecord::Migration
  def change
    add_column :parcels, :short_description, :text
  end
end

