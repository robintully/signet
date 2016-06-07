require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.name }
    f.email_address { Faker::Internet.email }
    f.password_digest { SecureRandom.hex(16) }
    f.email_confirmed  true
  end
end
