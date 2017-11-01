class User < ApplicationRecord
  before_save { email.downcase! }
  has_many :posts
  has_many :comments
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_FORMAT },
uniqueness: { case_sensitive: false }
end
