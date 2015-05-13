class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.integer :children_count

      t.timestamps
    end
    add_index :categories, :parent_id
    add_index :categories, :name
    add_index :categories, :lft
    add_index :categories, :rgt
    add_index :categories, :depth
    add_index :categories, :children_count
  end
end
