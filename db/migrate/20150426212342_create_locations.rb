class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :abbreviation
      t.string :title
      t.string :sub_location_title
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :children_count

      t.timestamps
    end
    add_index :locations, :name
    add_index :locations, :title
    add_index :locations, :sub_location_title
    add_index :locations, :parent_id
    add_index :locations, :lft
    add_index :locations, :rgt
    add_index :locations, :depth
    add_index :locations, :children_count
  end
end
