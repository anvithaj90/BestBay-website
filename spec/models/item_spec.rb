require 'spec_helper'

describe Item do
  context "association" do
    it "belongs to a user" do
      subject.should respond_to(:user)
    end
  end
  context "photo" do
    it "item should have attached photo" do
  subject.should have_attached_file(:photo)
  #subject.should validate_attachment_presence(:photo)
  subject.should validate_attachment_size(:photo).less_than(5.megabytes)
    end
    end
  context "is not valid without "  do
  it "a name" do
    subject.should_not be_valid
    subject.errors[:name].should_not be_empty
  end

  it "quantity" do
    subject.price = 199
    subject.should_not be_valid
    subject.errors[:quantity].should_not be_empty
  end

  it "a general description" do
    subject.quantity = 2
    subject.should_not be_valid
    subject.errors[:general_description].should_not be_empty
  end

    #it 'a photo' do
    #  subject.general_description = "Brand basic_information"
    #  subject.should_not be_valid
    #
    #
    #end
  end

  context "should be valid"    do

  it 'with name, price, quantity, general description'   do
    subject.name = "IPhone"
    subject.price = 199
    subject.quantity = 2
    subject.general_description = "Brand basic_information"
    #subject.photo = ("/assets/images/Cappuccino.jpg")
  subject.should be_valid
  end
end



    context 'The ' do

      before {
        subject.name = "IPhone"
        subject.price = 199
        subject.quantity = 2
        subject.general_description = "Brand basic_information"
      }

  context "quantity" do
    it 'should be greater than or equal to 0'   do
      subject.quantity = -1
    subject.should_not be_valid
    end

    it 'should be less than 10000'   do
       subject.quantity = 10001
    subject.should_not be_valid
    end


  end

  context 'general description ' do
    it 'should not be greater than 170 characters ' do
      subject.general_description = "a" * 171
      subject.should_not be_valid

    end
  end

  end




end
