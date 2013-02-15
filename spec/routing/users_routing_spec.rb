require "spec_helper"

describe UsersController do
  before { @user = User.new(name: "Example User", email: "user@example.com",password: "123456",password_confirmation: "123456") }
  describe "routing" do
    it "routes to #profile" do
      get("/users/profile").should route_to("users#profile")
    end
  end
  describe "routing" do
    it "routes to #profile" do
      get("/users/profile_info").should route_to("users#profile_info")
    end
  end
end
