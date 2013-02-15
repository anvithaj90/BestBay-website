# This is the database migration for adding user id to item
class AddUserIdToItems < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    add_column :items, :user_id, :integer
    add_index :items, [:user_id]
  end
end
