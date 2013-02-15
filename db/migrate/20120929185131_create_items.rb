# This is the database migration for creating item
class CreateItems < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :general_description
      t.string :pic_path
      t.integer :category_id
      t.integer :seller_id
      t.string :quality

      t.timestamps
    end
  end
end
