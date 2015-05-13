class DropSubLocations < ActiveRecord::Migration
  def change
    drop_table :sub_locations
  end
end
