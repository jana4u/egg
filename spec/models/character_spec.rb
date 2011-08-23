require 'spec_helper'

describe Character do
  describe "when being created" do
    it "should require name to be unique" do
      Factory(:character, :name => "Name")

      user = Factory.build(:character, :name => "")
      user.should_not be_valid
      user.errors[:name].should include("can't be blank")

      user = Factory.build(:character, :name => "Name")
      user.should_not be_valid
      user.errors[:name].should include("has already been taken")

      user = Factory.build(:character, :name => "name")
      user.should be_valid
      user.errors[:name].should be_empty
    end
  end
end
