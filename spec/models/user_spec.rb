require 'spec_helper'

describe User do
  it "has a valid factory" do
    Factory.create(:user).should be_valid
  end
  it "is invalid without a name"
  it "is invalid without an email address"
end
