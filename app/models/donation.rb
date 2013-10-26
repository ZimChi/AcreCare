class Donation < ActiveRecord::Base
  attr_accessible :acrename,
                  :donor_email,
                  :donor_firstname,
                  :donor_lastname,
                  :recipient_firstname,
                  :recipient_lastname,
                  :message,
                  :numberofacres,
                  :gift,
                  :gift_sender_name,
                  :recipient_email,
                  :parcel
  validates_presence_of :donor_firstname, :donor_lastname,  :donor_email
end
