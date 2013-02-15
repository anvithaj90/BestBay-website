
require 'spec_helper'

describe ShoppingCart do

  context "associations" do
    it "belongs to an item" do
      subject.should respond_to(:item)
    end

   it "belongs to a user" do
      subject.should respond_to(:user)
    end
  end
end
