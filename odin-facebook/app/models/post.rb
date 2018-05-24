class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  # Validations
  validates :content,  presence: true
  validates :user, presence: true

  def count_likes
    self.likes.length
  end

end
