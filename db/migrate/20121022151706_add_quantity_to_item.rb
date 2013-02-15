# This is the database migration for adding quantity for item
class AddQuantityToItem < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    add_column :items, :quantity, :integer
  end
end
