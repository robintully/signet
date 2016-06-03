class Parchment < ApplicationRecord
  belongs_to :envelope
  delegate :user, to: :envelope
end
