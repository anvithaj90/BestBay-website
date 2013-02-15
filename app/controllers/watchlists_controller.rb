# This is the controller for Watchlist
class WatchlistsController < ApplicationController
  # Check if this user exist and valid
  before_filter :authenticate_user!

  # Create Action
  # - create a watchlist relationship between the
  #   user and the item by passing in the item id
  def create
    @item = Item.find(params[:watchlist][:item_id])
    current_user.follow!(@item)

    respond_to do |format|
      format.html { redirect_to @item }
      format.js
    end
  end

  # Destroy Action
  # - destroy a watchlist relationship between the
  #   user and the item by passing in the item id
  def destroy
    @item = Watchlist.find(params[:id]).item
    current_user.unfollow!(@item)

    respond_to do |format|
      format.html { redirect_to @item }
      format.js
    end
  end
end
