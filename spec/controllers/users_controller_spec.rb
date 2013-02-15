require 'spec_helper'

describe "User pages" do

  subject { page }
  # After clicking on sign in, user should go to the sign in page as expected
  describe "signin page" do

    before  { visit "./users/sign_in"}

    it { should have_selector('p',    text: "Don't have an account? Create Now!") }

    it { should have_selector('label', text: 'Email') }

    it { should have_selector('label', text: 'Password') }
  end

  describe "signup page" do

    before  {visit "./users/sign_up"}

    it { should have_selector('h3',    text: 'Welcome to Barterbots') }

    it { should have_selector('label', text: 'Nickname') }

    it { should have_selector('label', text: 'Email') }

    it { should have_selector('label', text: 'Password') }

    it { should have_selector('label', text: 'Password confirmation') }
  end

end
