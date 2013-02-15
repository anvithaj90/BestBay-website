# This is the database migration for modifying index of category
class ModifyIndexesInCategories < ActiveRecord::Migration
  # change the number in database when some parameters change
   def change
      add_index :cate_item_associations, :item_id
      add_index :cate_item_associations, :category_id
      add_index :cate_item_associations, [:item_id, :category_id], unique: true
      
    end
end
