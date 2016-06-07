require 'spec_helper'

describe Envelope do
  it "has a valid factory" do
    FactoryGirl.create(:envelope).should be_valid
  end
  it "belongs to a user" do
    FactoryGirl.build(:envelope, user_id: nil).should_not be_valid
  end
  it "has a human readable slug on save" do
    FactoryGirl.create(:envelope, slug: "beef").should be_valid
  end
end