
# This is the controller for item
class ItemsController < ApplicationController
  before_filter :authenticate_user!, only: [:basic_information, :upload_pics, :set_price, :vote]
  # GET /items
  # GET /items.json
  helper_method :sort_column, :sort_direction


  # items#index action
  # - items listing page is accessed through this action
  # - One can pass a parameter through the URL to do
  #   a global search.
  # Item's CRUD actions
  def index
    @items = []
    @searchStr = params[:search]
    # Initialize selected index of categories
    @selected_sub_cate_id = 0
    @selected_parent_cate_id = 0

    @parentCategories = Category.find_all_by_category_level(1)
    @subCategories = []
    @category = params[:category]
    @mode = params[:mode]

    if params[:category].blank?
      @items = Item.all

    else
      @category = Category.find(params[:category])
      if @category.category_level == 2
          #set index
          parent = @category.parent_category
          @selected_parent_cate_id = parent.id
          @selected_sub_cate_id = @category.id
          #get data
          @items = @category.items

          @subCategories = parent.children_categories
      else
          #set index
        @selected_parent_cate_id = @category.id
          #get data
        @category.children_categories.each do |sub_cate|
          @items += sub_cate.items
        end

        @subCategories = @category.children_categories
      end
    end

    @items = @items.select {|s| s.name.include? @searchStr}  if !@searchStr.blank?

    respond_to do |format|
      format.html #{ redirect_to items_path}# index.html.erb
      format.json { render json: @items }
      format.js
      format.xml { render :xml => @items}
    end
  end
  # switch_mode action
  # call when user is trying to change between grid and list mode
  def switch_mode
    respond_to do |format|
      format.html { redirect_to :controller => 'items', :action => 'index', :mode => params[:mode]}# index.html.erb
      format.json { render json: @items }
      format.js
    end
  end

  # search_result action
  # = no view associated with it
  # - called when user is trying to search from pages
  #   other than the items listing page
  # - send the search string to the index action
  def search_result
    @items = Item.all
    @items = Item.search(params[:search])
    respond_to do |format|
      format.html { redirect_to :controller => 'items', :action => 'index', :search => params[:search]}# index.html.erb
      format.json { render json: @items }
      format.js
    end
  end

  # Basic CRUD actions for item
  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
      format.js
    end
  end

  # GET /items/basic_information
  # GET /items/basic_information.json
  def basic_information
    # create a new item with no parameters
    @item = Item.new
    # save the new item into a session
    session[:new_item] = @item
    # set category for this item
    @parentCategories = Category.find_all_by_category_level(1)
    @categoryArray = []
    i = 0
    @parentCategories.each do |pCate|
        @categoryArray[i] = pCate.children_categories
        i = i + 1
    end
    respond_to do |format|
      format.js

      format.html

      format.json { render json: @item }

    end
  end
  # Save item name, quantity, category, subcategory and general description into database
  def save_basic
    @item = Item.new
    # set user_id, name, general description, quantity and category for this item
    @item.user_id = current_user.id

    @item.name = params[:name]
    @item.general_description = params[:general_description]
    @item.quantity = params[:quantity]
    @sub_category = Category.find(params[:subCategoryId])

    respond_to do |format|
      if @item.save
        @item.follow!(@sub_category)
        session[:new_id] = @item.id
        format.html { render action: "upload_pics"  }
        format.json { render json: session[:new_item], status: :created, location: @item }
        format.js
      else
        @parentCategories = Category.find_all_by_category_level(1)
        @categoryArray = []
        i = 0
        @parentCategories.each do |pCate|
          @categoryArray[i] = pCate.children_categories
          i = i + 1
        end

        format.html { render action: "basic_information" }
        format.json { render json: session[:new_item].errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # GET /items/upload_pics
  # GET /items/upload_pics.json

  def upload_pics
    @item = Item.find_by_id(session[:new_id])
    # get the item with new_id
    respond_to do |format|
        format.html { }
        format.json { render json: session[:new_item].errors, status: :unprocessable_entity }
        format.js
    end
  end

  # GET /items/set_price
  # GET /items/set_price.json
  def set_price
    @item = Item.find_by_id(session[:new_id])
    # get the item with new_id
    respond_to do |format|
      if
        format.html {}
        format.json { render json }
        format.js
      else
        format.html { render action: "upload_pics" }
        format.json { render json }
        format.js
      end
    end
  end

  # Save uploaded pictures into database
  def save_picture
    # get the item with new_id
    # set the photo for this item
    @item = Item.find_by_id(session[:new_id])
    @item.photo = params[:photo]

    respond_to do |format|
      if @item.save
        format.html { redirect_to :action=>'upload_pics'}
        format.json { render json: session[:new_item], status: :created, location: @item }
        format.js
      else
        format.html { render action: "upload_pics" }
        format.json { render json: session[:new_item].errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  # Edit the photo for this item
  def modify_picture
    # get the item with new_id
    # set the photo for this item
    @item = Item.find_by_id(session[:new_id])
    @item.photo = params[:photo]

    respond_to do |format|
      if @item.save
        format.html { redirect_to :action=>'edit', :id=>@item.id }
        format.json { render json: session[:new_item], status: :created, location: @item }
        format.js
      else
        format.html { render action: "upload_pics" }
        format.json { render json: session[:new_item].errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # GET /items/1/edit
  def edit
    # get the item with id
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  # Save the price and previous information to database
  def create

    @item = Item.find_by_id(session[:new_id])
    puts @item.price
    puts @item.bidding_start_price
    @item[:price] = params[:price]
    @item[:bidding_start_price] = params[:bidding_start_price]

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json {}
        format.js
      else
        format.html { render action: "set_price" }
        format.json

        format.js
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])


    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to '/users/profile' }
      format.json { head :no_content }
    end
  end
  # This is the function that for users to like or dislike this product as comments
  def vote
    value = params[:type] == "Like" ? 1 : -1
    @item = Item.find(params[:id])
    @item.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end



  def user_watchlist
    user = User.find_by_id(params[:user_id])
    @items = user.followed_items

    respond_to do |format|
      format.xml { render :xml => @items}
    end
  end

  def user_shoppingcart
    user = User.find_by_id(params[:user_id])
    @items = user.cart_items

    respond_to do |format|
      format.xml { render :xml => @items}
    end
  end

  def get_user_id
    user = User.find_by_email(params[:email])

    respond_to do |format|
      format.xml { render :xml => user}
    end
  end

  def get_item_bidding
    @item = Item.find_by_id(params[:item_id])

    respond_to do |format|
      format.xml { render :xml => @item.biddings}
    end
  end

end
