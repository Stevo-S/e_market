class Category < ActiveRecord::Base
  include TheSortableTree::Scopes
  
  has_many :products
  
  acts_as_nested_set
end
