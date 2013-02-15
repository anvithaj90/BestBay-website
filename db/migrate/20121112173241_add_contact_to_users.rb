# This is the contacts of this user
class AddContactToUsers < ActiveRecord::Migration
  # user can edit his contact in this function
  def change
    add_column :users, :contact, :text
  end
end
