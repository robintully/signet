class User < ApplicationRecord
  has_many :envelopes
  has_many :parchments, through: :envelopes
  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true
  has_secure_password

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end

  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end
