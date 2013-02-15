require 'spec_helper'

describe "Item pages" do

  subject { page }
  # After clicking on sign in, user should go to the sign in page as expected
  describe "home page" do

    before  { visit "/"}

    it { should have_selector('span',    text: "Featured") }

    it { should have_selector('span', text: 'Best Seller') }

    it { should have_selector('span', text: 'Watchlist') }

  end

  describe "about us page" do

    before  {visit "./static_pages/about"}

    it { should have_selector('span',    text: 'FAQ') }

    it { should have_selector('span',    text: 'Team BarterBots') }
  end

end