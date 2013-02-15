# This is the model for watchlist
class Watchlist < ActiveRecord::Base
  # This model contains two attributes including item_id and user_id
  attr_accessible :item_id, :user_id
  # This model associates with item and user
  belongs_to :item
  belongs_to :user

end
