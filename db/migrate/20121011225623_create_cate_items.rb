# This is the database migration for creating category and item association
class CreateCateItems < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    create_table :cate_items do |t|
      t.string :name

      t.timestamps
    end
  end
end
