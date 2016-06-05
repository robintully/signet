require 'spec_helper'

describe Parchment do
  it "has a valid factory" do
    FactoryGirl.create(:parchment).should be_valid
  end
end