require 'spec_helper'

describe Bidding do
  context "associations" do
    it "belongs to an item" do
      subject.should respond_to(:item)
    end

    it "belongs to a user" do
      subject.should respond_to(:bidder)
    end
  end
end
