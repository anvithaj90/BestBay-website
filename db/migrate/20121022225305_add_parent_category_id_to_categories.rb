# This is the database migration for adding parent category id to category
class AddParentCategoryIdToCategories < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    add_column :categories, :parent_category_id, :integer
    add_column :categories, :category_level, :integer
  end
end
