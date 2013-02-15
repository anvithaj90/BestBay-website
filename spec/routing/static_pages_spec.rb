require "spec_helper"

describe StaticPagesController do
  describe "routing" do
    it "routes to #aboutus" do
      get("static_pages/about").should route_to("static_pages#about")
    end
  end
  describe "routing" do
    it "routes to #contact" do
      get("static_pages/contact").should route_to("static_pages#contact")
    end
  end
end