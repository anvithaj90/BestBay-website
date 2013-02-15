require 'spec_helper'

describe Category do
  let(:category){ Category.create!(name: "Smart Phone", subtitle: "some subtitle", category_level: 1) }
  let(:sub_category) {Category.create!(name: "iPhone", subtitle: "some subtitle for iphone",
                                        category_level: 2, parent_category_id: category.id)
  }

  subject { category }

  it {should respond_to(:name)}
  it {should respond_to(:subtitle)}
  it {should respond_to(:parent_category_id)}
  it {should respond_to(:category_level)}

  its(:children_categories) {should include(sub_category)}

  context "raises an error if saved" do
    it "without an name" do
      subject.name = nil
      expect { subject.save! }.to raise_error(
                                      ActiveRecord::RecordInvalid
                                  )
    end
    it "without an category_level" do
      subject.category_level = nil
      expect { subject.save! }.to raise_error(
                                      ActiveRecord::RecordInvalid
                                  )
    end
  end
end

describe "Sub-Category" do
  let(:category){ Category.create!(name: "Smart Phone", subtitle: "some subtitle", category_level: 1) }
  let(:sub_category) {Category.create!(name: "iPhone", subtitle: "some subtitle for iphone",
                                       category_level: 2, parent_category_id: category.id)
  }

  subject { sub_category }

  its(:parent_category) {should == category}
end