require 'faker'

FactoryGirl.define do
  factory :parchment do |f|
    file  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/screenshot.png')))
    association :envelope, factory: :envelope
  end
end