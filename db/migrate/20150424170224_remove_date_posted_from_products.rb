class RemoveDatePostedFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :date_posted
  end
end
