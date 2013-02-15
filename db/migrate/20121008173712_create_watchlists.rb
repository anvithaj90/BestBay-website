# This is the database migration for creating watchlist
class CreateWatchlists < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    create_table :watchlists do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
    add_index :watchlists, :user_id
    add_index :watchlists, :item_id
    add_index :watchlists, [:user_id, :item_id], unique: true
  end
end
