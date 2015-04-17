class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.float :price
      t.text :description
      t.datetime :date_posted

      t.timestamps
    end
  end
end
