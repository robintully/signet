class Envelope < ApplicationRecord
  has_many :parchments
  belongs_to :user
  validates :slug, presence: true
  accepts_nested_attributes_for :parchments

  def to_param
    slug
  end

end
