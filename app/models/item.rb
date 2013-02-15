# Item Class
# - Item is the basic class for an
#   item that's on sale
class Item < ActiveRecord::Base
  # The item model includes many attributes including category_id, general description, user id, photo, price and quantity
  attr_accessible :category_id, :general_description, :user_id, :name, :pic_path,
                  :price, :quality, :photo, :quantity, :is_for_bid, :bid_end_time, :bidding_start_price

  has_many :watchlists, dependent: :destroy
  has_many :shopping_carts, dependent: :destroy
  has_many :biddings, dependent: :destroy
  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum

  # The search is implemented
  # so that it only search for names
    def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
    end

  # This is how we attach photo to items
  has_attached_file :photo,
                    #:styles => {
                    #    :small  => "100x100>" },
                    :url => "/assets/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
 #validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates :name, :presence => {:message => 'Sorry, Name cannot be blank'}
  validates :general_description, :presence => {:message => 'Sorry, Description cannot be blank'}, :length => {:maximum => 170, :minimum => 1}
  #validates :price, :presence => {:message => 'Sorry, Price cannot be blank'}, :numericality => true, :inclusion => {:in => 1..100000}
  validates :quantity, :presence => {:message => 'Sorry, Quantity cannot be blank'},  :numericality => true, :inclusion => {:in => 0..10000}
  has_many :cate_item_associations, dependent: :destroy
  has_many :categories, through: :cate_item_associations, source: :categories

  # Check an item's category
  def following?(other_category)
    cate_item_associations.find_by_category_id(other_category.id)
  end

  # Categorize an item
  def following!(other_category)
    cate_item_associations.find_by_category_id(other_category.id)
  end

  # Remove item from certain category
  def unfollow!(other_category)
    self.cate_item_associations.find_by_category_id(other_category.id).destroy
  end
  # Follow item
  def follow!(cate)
    self.cate_item_associations.create!(category_id: cate.id)
  end
  # Find who is following
  def self.from_user_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          followed_user_ids: followed_user_ids, user_id: user)
  end
  # This function shows the highest bidding now
  def current_highest_bid
    biddings.last
  end
end