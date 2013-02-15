# This is the database migration for renaming category and item association
class RenameCategoriesToCateItemAssociations < ActiveRecord::Migration
      def self.up
          rename_table :categories, :cate_item_associations
      end 
     
      def self.down
          rename_table :cate_item_associations, :categories
      end
end
