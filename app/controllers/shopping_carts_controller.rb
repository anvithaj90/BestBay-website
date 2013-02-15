# This is the controller for shopping cart
class ShoppingCartsController < ApplicationController
  before_filter :authenticate_user!

  # Create Action
  # - create a shopping cart relationship between the
  #   user and the item by passing in the item id
  def create
    # pass two parameters shopping_cart and item_id to this action
    @item = Item.find(params[:shopping_cart][:item_id])
    # check if the quantity of the item and if this item is already in shopping cart
    if current_user.in_cart?(@item)
      current_user.add_quantity_to_existing_item(@item, params[:shopping_cart][:quantity])
      #@item.quantity -= Integer(params[:shopping_cart][:quantity])
      #@item.save
    else
      current_user.add_item_to_cart!(@item, params[:shopping_cart][:quantity])
      #@item.quantity -= Integer(params[:shopping_cart][:quantity])
      #@item.save
    end

    respond_to do |format|

      format.html { redirect_to :controller => 'items', :action => 'show', :id => @item.id}
      puts @item.quantity
      format.js
    end
  end

  # Destroy Action
  # - destroy a shopping cart relationship between the
  #   user and the item by passing in the item id
  def destroy
    # get the item with id and get the quantity of this item
    @item = ShoppingCart.find(params[:id]).item

    @item.save
    current_user.remove_item_from_cart!(@item)
    # remove the item from shopping cart
    respond_to do |format|
      format.html { redirect_to @item }
      format.js
    end
  end


  def confirm
    # get the item with id and get the quantity of this item
    @user = current_user
    @shopping_carts = @user.shopping_carts
    @shopping_carts.each do |cart_item|
      cart_item.item.quantity -= cart_item.quantity
       cart_item.item.save

        @user.remove_item_from_cart!(cart_item.item)

    end
    #@item.quantity -= Integer(params[:shopping_cart][:quantity])
    #@item.save
    #
    #@item = ShoppingCart.find(params[:id]).item
    #@item.quantity = current_user.shopping_carts.find(params[:id]).quantity
    #@item.save
    #current_user.remove_item_from_cart!(@item)
    # remove the item from shopping cart
    respond_to do |format|
      format.html { redirect_to items_url }
      format.js
    end
  end

end
