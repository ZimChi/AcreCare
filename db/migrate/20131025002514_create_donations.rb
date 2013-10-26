class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :donor_firstname
      t.string :donor_lastname
      t.string :donor_email
      t.string :acrename
      t.string :gift_sender_name
      t.string :recipient_firstname
      t.string :recipient_lastname
      t.string :recipient_email
      t.string :message
      t.string :parcel
      t.string :gift    #simple_for_form issue - rather this be boolean
      t.integer :numberofacres

      t.timestamps
    end
  end
end
