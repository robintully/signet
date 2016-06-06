ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'database_cleaner'
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

# do the things
def sign_up_user
  before do
    visit sign_up_path
    fill_in "Name", with: "Steven Nuñez"
    fill_in "Email address", with: "beeflover101@flatironschool.com"
    fill_in "Password", with: "secretvegetarian"
    fill_in "Password confirmation", with: "secretvegetarian"
    click_button "Register User"
  end
end
