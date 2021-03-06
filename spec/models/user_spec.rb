require 'spec_helper'

describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end
  it "is valid witho a flatiron email address" do
    FactoryGirl.build(:user, email_address: Faker::Name.name  + "@flatironschool.com" ).should be_valid
  end
end
