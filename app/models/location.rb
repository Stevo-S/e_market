class Location < ActiveRecord::Base
  has_many :sub_locations, class: "Location", foreign_key: "parent_location_id"
  
  belongs_to :parent_location, class: "Location"
end
