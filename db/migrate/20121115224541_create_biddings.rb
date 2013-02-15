# This is for create a bid
class CreateBiddings < ActiveRecord::Migration
  # Place a bid
  def change
    create_table :biddings do |t|
      t.integer :item_id
      t.integer :bidder_id
      t.integer :bid_price

      t.timestamps
    end
  end
end
