# spec/factories/my_files.rb
FactoryGirl.define do
 factory :carrierwave do
   photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/screenshot.png')))
 end
end