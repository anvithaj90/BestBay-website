=begin
require 'spec_helper'

describe CateItemsController do

  describe "GET 'basic_information'" do
    it "returns http success" do
      get 'basic_information'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit'
      response.should be_success
    end
  end


end
=end