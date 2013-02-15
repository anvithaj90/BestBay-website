require "spec_helper"

describe ItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/items").should route_to("items#index")
    end

    it "routes to #basic_information" do
      get("/items/basic_information").should route_to("items#basic_information")
    end

    it "routes to #show" do
      get("/items/1").should route_to("items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/items/1/edit").should route_to("items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/items").should route_to("items#create")
    end

    it "routes to #update" do
      put("/items/1").should route_to("items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/items/1").should route_to("items#destroy", :id => "1")
    end
    before { @user = User.new(name: "Example User", email: "user@example.com",password: "123456",password_confirmation: "123456") }
    describe "routing" do
      it "routes to #item/new" do
        get("/items/new").should route_to("items#basic_information")
      end
    end
    describe "routing" do
      it "routes to #items/upload_pics" do
        get("/items/upload_pics").should route_to("items#upload_pics")
      end
    end
    describe "routing" do
      it "routes to #items/set_price" do
        get("/items/set_price").should route_to("items#set_price")
      end
    end
  end
end
