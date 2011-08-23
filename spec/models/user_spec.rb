require 'spec_helper'

describe User do
  describe "when being created" do
    it "should require email address to be unique" do
      Factory(:user, :email => "user@example.com")
      user = Factory.build(:user, :email => "User@example.com")
      user.should_not be_valid
      user.errors[:email].should include("has already been taken")
    end
  end
end
