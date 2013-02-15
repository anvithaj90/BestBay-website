class BiddingsController < ApplicationController
  # Create Action
  # - create a shopping cart relationship between the
  #   user and the item by passing in the item id
  def create
    # pass two parameters shopping_cart and item_id to this action
    puts params
    @item = Item.find(params[:bidding][:item_id])
    # check if the quantity of the item and if this item is already in shopping cart
    respond_to do |format|
      # bidder can only place bid with a 5% increase in price
      # otherwise there will be a notice
      if @item.biddings.count > 0
        if @item.biddings.last.bid_price * 1.05 > params[:bidding][:bid_price].to_i
          format.html { redirect_to @item, notice: "Please bid at a price that's 5% higher than the current highest bid" }
          format.js
        else
          current_user.bid!(@item, params[:bidding][:bid_price])
          format.html { redirect_to @item }
          format.js
        end
      else
        current_user.bid!(@item, params[:bidding][:bid_price])
        format.html { redirect_to @item }
        format.js
      end
    end
  end

end
