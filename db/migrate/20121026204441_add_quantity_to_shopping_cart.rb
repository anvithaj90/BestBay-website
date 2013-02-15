# This is the database migration for adding quantity for shopping cart
class AddQuantityToShoppingCart < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    add_column :shopping_carts, :quantity, :integer
  end
end
