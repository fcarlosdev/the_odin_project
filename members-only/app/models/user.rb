class User < ApplicationRecord

  has_many :posts, dependent: :destroy

  before_create :remember_user

  has_secure_password

  private

  def remember_user
    self.remember_token = User.encrypt_token(User.new_token)
  end

  def User.encrypt_token(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

end
