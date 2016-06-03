class Envelope < ApplicationRecord
  has_many :parchments
  belongs_to :user
  has_attached_file :parchment

end
