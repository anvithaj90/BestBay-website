# This is the database migration for renaming category and items association
class RenameCateItemsToCategories < ActiveRecord::Migration
  def self.up
          rename_table :cate_items, :categories
      end 
      def self.down
          rename_table :categories, :cate_items
      end
end
