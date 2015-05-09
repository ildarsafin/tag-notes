require 'securerandom'

class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable,
         :registerable, :validatable

  validates :email, presence: true, uniqueness: true

  before_save :ensure_access_token

  def ensure_access_token
    self.access_token = generate_access_token if access_token.blank?
  end

  private

  def generate_access_token
    loop do
      token = Devise.friendly_token
      break token unless User.find_by_access_token(token)
    end
  end
end
