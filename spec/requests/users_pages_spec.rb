require "spec_helper"
  describe "user registration" do
     describe "sign up" do
    it "allows new users to register with an email address and password" do
      visit "/users/sign_up"

      fill_in "Email",                 :with => "alindeman@example.com"
      fill_in "Password",              :with => "ilovegrapes"
      fill_in "Password confirmation", :with => "ilovegrapes"

      click_button "Sign up"
      page.should have_content("Sell")
      page.should have_content("Shopping Cart")
    end
     end

    describe "sign in" do
    it "allows new users to sign in with an email address and password" do
      visit "/users/sign_in"
      fill_in "Email",                 :with => "alindeman@example.com"
      fill_in "Password",              :with => "ilovegrapes"


      click_button "Sign in"
      page.should have_content("Sell")
      page.should have_content("Shopping Cart")
    end
    end

end