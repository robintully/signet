class User < ApplicationRecord
  has_many :envelopes
  has_many :parchments, through: :envelopes
  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true
  has_secure_password

end
