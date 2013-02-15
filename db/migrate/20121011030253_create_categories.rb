# This is the database migration for creating category
class CreateCategories < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    create_table :categories do |t|
      t.integer :item_id
      t.integer :cate_item_id

      t.timestamps
    end
    add_index :categories, :item_id
    add_index :categories, :cate_item_id
    add_index :categories, [:item_id, :cate_item_id], unique: true
  end
end
