class Parcel < ActiveRecord::Base
  attr_accessible :description, :short_description, :icon, :title, :latitude, :longitude, :imagename
end
