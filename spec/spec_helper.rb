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

  config.after(:each) do
    if Rails.env.test? || Rails.env.cucumber?
      FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
    end 
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
    user = User.find_by(name: "Steven Nuñez")
    user.email_confirmed = true
    user.save
  end
end

def sign_in_as_test_user
  before do
    test = User.new
    test.email_address = 'test@flatironschool.com'
    test.name = "test test"
    test.password_digest = "$2a$10$nIMp0J50Yr.ytZOyeLg96uipytN4Fa2pyh4jW1k4obLlfyKUPXi4K"
    test.email_confirmed = true
    test.save
    visit sign_in_path
    fill_in "Email address", with: "test@flatironschool.com"
    fill_in "Password", with: "test"
    find('input[type=submit]').click
  end
end


def sign_in_user
  before do
    visit sign_in_path
    fill_in "Email address", with: "test@flatironschool.com"
    fill_in "Password", with: "test"
    find('input[type=submit]').click
  end
end

