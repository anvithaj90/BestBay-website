# This is the database migration for adding nicknames to users
class AddNameToUsers < ActiveRecord::Migration
  # change the number in database when some parameters change
  def change
    add_column :users, :name, :string
  end
end
