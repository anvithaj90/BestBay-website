require 'spec_helper'

describe "StaticPages" do
  describe "Landing Page" do
    it "should have LOGO" do
      visit '/static_pages/home'
      page.should have_content("MobiDr")
    end
  end

  describe "Career Page" do
    it "should have career information" do
      visit '/static_pages/career'
      page.should have_content("career")
    end
  end

  describe "Contact Page" do
    it "should have contact information" do
      visit '/static_pages/contact'
      page.should have_content("contact")
    end
  end

  describe "About Us Page" do
    it "should have about information" do
      visit '/static_pages/about'
      page.should have_content("FAQ")
    end
  end
  describe "About Us Page" do
    it "should have about information" do
      visit '/static_pages/about'
      page.should have_content("Team BarterBots")
    end
  end
end