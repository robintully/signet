class User < ApplicationRecord
  has_many :envelopes
  has_many :parchments, through: :envelopes
  validate :name, presence: true
  validate :email, presence: true, uniqueness: true

end
