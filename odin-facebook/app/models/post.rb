class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes

  def count_likes
    self.likes.length
  end

end
