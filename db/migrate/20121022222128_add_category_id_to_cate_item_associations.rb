# This is the database migration for adding category id to item and category association
class AddCategoryIdToCateItemAssociations < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    add_column :cate_item_associations, :category_id, :integer
  end
end
