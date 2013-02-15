# This is the database migration for creating shopping cart
class CreateShoppingCarts < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    create_table :shopping_carts do |t|
      t.integer :user_id
      t.integer :item_id
      t.integer :subtotal

      t.timestamps
    end

    add_index :shopping_carts, :user_id
    add_index :shopping_carts, :item_id
    add_index :shopping_carts, [:user_id, :item_id], unique:true
  end
end
