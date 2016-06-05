class Envelope < ApplicationRecord
  has_many :parchments
  belongs_to :user
  validates :slug, presence: true

end
