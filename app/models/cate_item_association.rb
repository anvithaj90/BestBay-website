# CateItemAssociation Class
# - CateItemAssociation serves as the relation ship table
#   that connects the many to many relationship
#   between Item and Category
class CateItemAssociation < ActiveRecord::Base
  attr_accessible :category_id, :item_id
  # It has two parameters: category id and item id
  # It associate these two attributes
  belongs_to :category, class_name: "Category"
  belongs_to :item, class_name: "Item"

end
