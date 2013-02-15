# This is the database migration for removing associations between item and category
class RemoveCateItemIdFromCateItemAssociations < ActiveRecord::Migration
  # This can add item to a category
  def up
    remove_column :cate_item_associations, :cate_item_id
  end
  # This can delete a item from a category
  def down
    add_column :cate_item_associations, :cate_item_id, :integer
  end
end
