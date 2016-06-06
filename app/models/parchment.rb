class Parchment < ApplicationRecord
  belongs_to :envelope
  delegate :user, to: :envelope
   mount_uploader :file, FileUploader
     # validates :file, file_size: { less_than: 2.bytes }
end
