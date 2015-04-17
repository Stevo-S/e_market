class CreateSubLocations < ActiveRecord::Migration
  def change
    create_table :sub_locations do |t|

      t.timestamps
    end
  end
end
