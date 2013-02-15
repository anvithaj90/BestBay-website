# This is the model for shopping cart
class ShoppingCart < ActiveRecord::Base
  # This model has four attributes including item_id, subtotal,user_id, quantity
  attr_accessible :item_id, :subtotal, :user_id, :quantity
  # It associates with user and item
  belongs_to :user, class_name: "User"
  belongs_to :item, class_name: "Item"
  # Validate the presence of user
  validates :user_id, presence: true

  # This is the function that lead user to paypal page
  def paypal_url(return_url)

    #@user = current_user

    values = {
        :business => 'seller_1353279998_biz@googlegroups.com',
        :cmd => '_cart',
        :upload => 1,
        :return => return_url,
        :invoice => id
    }

    user.shopping_carts.each_with_index do |cart, index|
      values.merge!({
                        "amount_#{index + 1}" => cart.item.price,
                        "item_name_#{index + 1}" => cart.item.name,
                        "item_number_#{index + 1}" => cart.item.id,
                        "quantity_#{index + 1}" => cart.quantity
                    })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
