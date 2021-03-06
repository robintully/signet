class Envelope < ApplicationRecord
  has_many :parchments
  has_many :archives
  belongs_to :user
  validates :slug, presence: true, uniqueness: true
  accepts_nested_attributes_for :parchments
  has_secure_password  :validations => false

  def to_param
    slug
  end

end
