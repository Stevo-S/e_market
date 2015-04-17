class RelateCategoryToParentAndSubCategories < ActiveRecord::Migration
  def change
    add_reference :sub_categories, :parent_categories
  end
end
