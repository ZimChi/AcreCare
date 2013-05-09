class Parcel < ActiveRecord::Base
  attr_accessible :description, :icon, :title, :x, :y
end
