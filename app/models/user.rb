# This is the model for user
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :seller_type, :contact, :photo

  # attr_accessible :title, :body
  has_many :watchlists, dependent: :destroy
  has_many :followed_items, through: :watchlists, source: :item

  has_many :shopping_carts, dependent: :destroy
  has_many :cart_items, through: :shopping_carts, source: :item

  has_many :biddings, foreign_key: "bidder_id", dependent: :destroy
  has_many :bid_targets, through: :biddings, source: :item

  has_many :items
  has_attached_file :photo,# :styles => { :small => "150x150>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  #validates_attachment_presence :photo
  #validates_attachment_size :photo, :less_than => 5.megabytes
  #validates_attachment :photo, :content_type => { :content_type => "image/jpg" }

  validates_presence_of :name, :email, :password, :password_confirmation


  # Show what this user is following
  def following?(other_item)
    watchlists.find_by_item_id(other_item.id)
  end
  # Show what is in shopping cart for this user
  def in_cart?(other_item)
    shopping_carts.find_by_item_id(other_item.id)
  end
  # Follow certain item with id
  def follow!(other_item)
    watchlists.create!(item_id: other_item.id)
  end
  # Add items with quantity into shopping cart
  def add_item_to_cart!(other_item, quantity)
    shopping_carts.create!(item_id: other_item.id, quantity: quantity)
  end
  # If the item is already in shopping cart, change the quantity in this function
  def add_quantity_to_existing_item(item, quantity)
    @relationship = shopping_carts.find_by_item_id(item.id)
    @relationship.quantity += Integer(quantity)
    @relationship.save
  end
  # Remove item from his watchlist
  def unfollow!(other_item)
    watchlists.find_by_item_id(other_item.id).destroy
  end
  # Remove item from current shopping cart
  def remove_item_from_cart!(other_item)
    shopping_carts.find_by_item_id(other_item.id).destroy
  end

  # Show what is in shopping cart for this user
  def bidded?(other_item)
    1 if biddings.find_all_by_item_id(other_item.id).count > 0
  end
  # Check the price for bidding
  def bid!(other_item, price)
    biddings.create!(item_id: other_item.id, bid_price: price)
  end
end
