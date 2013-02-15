# Category Class

class Category < ActiveRecord::Base
  # This model has four attributes: name, parent_category_id, category_level, subtitle
  attr_accessible :name, :parent_category_id, :category_level, :subtitle

  validates :name, :presence => {:message => 'Sorry,Name cannot be blank'}
  validates :category_level, :presence => {:message => 'Sorry,Category cannot be blank'}
  # get the children category with id
  def children_categories
    Category.find_all_by_parent_category_id(self.id)
  end
  # get parent category with parent category id
  def parent_category
    Category.find_by_id(self.parent_category_id)
  end

  has_many :children_categories, :class_name => "Category"
  belongs_to :parent_category, :class_name => "Category", :foreign_key => 'parent_category_id'

  has_many :cate_item_associations, dependent: :destroy
  has_many :items, through: :cate_item_associations, source: :item

  #Check if the item is under the category
  def associated_with?(other_item)
    cate_item_associations.find_by_item_id(other_item.id)
  end

  #Categorize an item under one category
  def associated_with!(other_item)
    self.cate_item_associations.create!(item_id: other_item.id)
  end

  #Remove item from current category
  def remove_association_with!(other_item)
    self.cate_item_associations.find_by_item_id(other_item.id).destroy
  end


end
