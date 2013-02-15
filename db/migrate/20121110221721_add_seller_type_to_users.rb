# This specifies the seller type for this user
class AddSellerTypeToUsers < ActiveRecord::Migration
  # This function is to change the type of this user
  # - default user is set as basic user
  def change
    add_column :users, :seller_type, :integer, :default => 0
  end
end
