# This is the bidding start price for item
class AddBiddingStartPriceToItem < ActiveRecord::Migration
  # The price is an integer and it relates with the item
  def change
    add_column :items, :bidding_start_price, :integer
  end
end
