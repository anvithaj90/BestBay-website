# This is the item and category association controller
class CateItemsController < ApplicationController
  # CateItem's CRUD actions
  # GET /items/new
  # Set information for a new item
  def new
    @cate_item = CateItem.new
  end
  # POST /items/new
  # Save this new item into database
  def create
    @cate_item = CateItem.new(params[:cate_item])

    respond_to do |format|
      if @cate_item.save
        format.html { redirect_to '/cate_items', notice: 'Category was successfully created.' }
        format.json { render json: @cate_item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @cate_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  # Update the information of one item with particular id
  def update
    @cate_item = CateItem.find(params[:id])

    respond_to do |format|
      if @cate_item.update_attributes(params[:cate_item])
        format.html { redirect_to @cate_item, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cate_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  # Delete one item with particular id
  def destroy
    @cate_item = CateItem.find(params[:id])
    @cate_item.destroy

    respond_to do |format|
      format.html { redirect_to '/cate_items' }
      format.json { head :no_content }
    end
  end

  # GET /items/show
  # Show detailed information about certain item with particular id
  def show
    @cate_item = CateItem.find(params[:id])
  end
  # GET /items/item[:id]/edit
  # Edit one specific item with particular id
  def edit
    @cate_item = CateItem.find(params[:id])
  end
  # GET /items/index
  # Show all the items in our website
  def index
    @all_categories = CateItem.all
  end
end
