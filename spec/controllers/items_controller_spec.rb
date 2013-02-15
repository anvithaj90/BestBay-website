require 'spec_helper'

describe "Item pages" do

  subject { page }
  # After clicking on sign in, user should go to the sign in page as expected
  describe "listing page" do

    before  { visit "./items"}

    it { should have_selector('h4',    text: "Listing Items") }

    it { should have_selector('th', text: 'Photo') }

    it { should have_selector('th', text: 'Name') }

    it { should have_selector('th', text: 'Description') }
  end

  describe "items grid page" do

    before  {visit "./items?mode=2"}

    it { should have_selector('span',    text: 'Listing Items') }

    it { should have_selector('h4',    text: 'Categories') }
  end
end

