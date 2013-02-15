class Bidding < ActiveRecord::Base
  # The bidding is related to bid_price, bidder_id and item_id
  attr_accessible :bid_price, :bidder_id, :item_id
  # This transaction involves bidder and item
  belongs_to :bidder, class_name: "User"
  belongs_to :item, class_name: "Item"
  # Validate the presence of user
  validates :bidder_id, :item_id, presence: true

end
