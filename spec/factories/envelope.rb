require 'faker'

FactoryGirl.define do
  factory :envelope do |f|
    association :user, factory: :user, name: Faker::Name.name
    f.slug { Faker::Hipster.word }
    f.password_digest { Faker::Internet.password(8, 20) }
    f.expiration { 2.days.from_now }
  end
end