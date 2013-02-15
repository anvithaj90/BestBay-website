require 'spec_helper'

describe "Items" do
  describe "listing page" do
    it "should have content" do
      visit '/items'
      page.should have_content("Listing Items")
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get items_path
      response.status.should be(200)
    end

    it "should have content" do
      visit '/items'
      page.should have_content("Categories")
      get items_path
      response.status.should be(200)
    end

    it "should have content" do
      visit '/items'
      page.should have_content("Photo")
      get items_path
      response.status.should be(200)
    end

    it "should have content" do
      visit '/items'
      page.should have_content("Name")
      get items_path
      response.status.should be(200)
    end
    it "should have content" do
      visit '/items'
      page.should have_content("All")
      get items_path
      response.status.should be(200)
    end

    it "should have content" do
      visit '/items'
      page.should have_content("Description")
      get items_path
      response.status.should be(200)
    end
  end
end
