require "spec_helper"

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com",password: "123456",password_confirmation: "123456") }

  subject { @user }

  context "associations" do
    it "has many to a items" do
      subject.should respond_to(:items)

    end

  end

  it "tests the name attribute" do

    should respond_to(:name)

  end

  it "tests the email attribute" do

   should respond_to(:email)

  end

  it "tests the password attribute" do

   should respond_to(:password)

  end

  it "verifies the validity of this example user" do

   should be_valid
  end

  describe "when name is nil" do
    before { @user.email = nil }
    it { should_not be_valid }

  end

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is nil" do
    before { @user.email = nil }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }

  end

  describe "when password is nil" do
    before { @user.password = nil }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }

  end

  describe "when password confirmation is nil" do
    before { @user.password = nil }
    it { should_not be_valid }
  end

  describe "when password confirmation is not present" do
    before { @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do

    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken" do

    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end


end