# This controller has home page, contact page, career page and about us page
class StaticPagesController < ApplicationController
  # Show all pictures and categories we have
  # get /home
  def home
    @rootCategories = Category.find_all_by_category_level(1)
  end
  # get /contact
  def contact
  end
  # get /career
  def career
  end
  # get /about
  def about
  end
end
