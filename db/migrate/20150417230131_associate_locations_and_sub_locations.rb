class AssociateLocationsAndSubLocations < ActiveRecord::Migration
  def change
    add_reference :sub_locations, :parent_locations
  end
end
