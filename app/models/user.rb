class User < ApplicationRecord
  has_many :envelopes
  has_many :parchments, through: :envelopes
end
