class Envelope < ApplicationRecord
  has_many :parchments
  belongs_to :user
  validates :slug, presence: true

  def to_param
    slug
  end

end
