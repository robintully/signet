require 'faker'

FactoryGirl.define do
  factory :parchment do |f|
    file  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/screenshot.png')))
    # f.s3_url {"//signetenvelopesdevelopment.s3.amazonaws.com/uploads/65a7b207-08a1-44a9-bcc1-b5d30294ca16/Jess & Will Married-117.jpg"}
  end
end