class User < ApplicationRecord

  # Associations

  has_many :posts
  has_many :comments

  has_one :profile, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_many :likes, dependent: :destroy

  # Validations

  validates :first_name,  presence: true
  validates :last_name,  presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Callbacks Function
  before_create :create_default_profile

  def friendships_requests(user_id)
    Friendship.where("friend_id = ?", user_id)
  end

  def friendship_accepted?(friend_id)
    friendship = self.friendships.find_by(friend_id:friend_id) ||
                 self.inverse_friendships.find_by(user_id:friend_id)
    friendship.accepted
  end

  def get_posts

    friends = accepted_friendships.each_with_object([]) do |f,arr|
      arr << f.user if f.user != self
      arr << f.friend if f.user == self
    end

    (self.posts + friends.map {|f| f.posts}.flatten)

  end

  def fullname
    first_name + " " + last_name
  end

  private

    def create_default_profile
      self.build_profile({email_notification: false})
    end

    def accepted_friendships
      self.friendships.select{|f| f.accepted } +
      self.inverse_friendships.select {|f| f.accepted }
    end



end
