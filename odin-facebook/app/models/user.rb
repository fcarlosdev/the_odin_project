class User < ApplicationRecord

  # Associations

  has_many :posts
  has_many :comments

  has_one :profile, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

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
    self.friendships.find_by(friend_id:friend_id).accepted
  end

  def fullname
    first_name + " " + last_name
  end

  private

    def create_default_profile
      self.build_profile({email_notification: false})
    end



end
