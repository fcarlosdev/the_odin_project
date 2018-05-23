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
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # Callbacks Function
  before_create :create_default_profile

  def self.from_omniauth(auth)
    puts "INFO=>#{auth.info.inspect}, First Name: #{auth.info.first_name}"
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider   = auth.provider
      user.uid        = auth.uid
      user.email      = auth.info.email
      user.first_name = auth.info.first_name || auth.info.name.split(" ")[0]
      user.last_name  = auth.info.last_name || auth.info.name.split(" ")[1]
      user.password   = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
     if data = session["devise.facebook_data"] &&
               session["devise.facebook_data"]["extra"]["raw_info"]
       user.email      = data["email"]      if user.email.blank?
       user.first_name = data["first_name"] if user.first_name.blank?
       user.last_name  = data["last_name"]  if user.last_name.blank?
       user.valid?
     end
   end
  end

  def self.new_user?(mail)
    self.find_by(email:mail).nil?
  end

  def has_friendship_with?(user)
    self.friendships.find_by(friend_id: user.id) ||
    user.friendships.find_by(friend_id: self.id)
  end

  def friendship_requested_by?(user)
    !self.friendships.find_by(friend_id: user.id, accepted: false).nil?
  end

  def get_friendship_with(user,accepted=false)
    self.friendships.find_by(friend_id: user.id, accepted: accepted) ||
    user.friendships.find_by(friend_id: self.id, accepted: accepted)
  end

  def friendship_requests
    self.friendships.find_by(friend_id: self.id, accepted: false)
  end

  def get_posts

    friends = accepted_friendships.each_with_object([]) do |f,arr|
      arr << f.user if f.user != self
      arr << f.friend if f.user == self
    end

    (self.posts + friends.map {|f| f.posts}.flatten)

  end

  def friends

    friends_friended = self.friendships.select(:id, :friend_id)
                                     .where(user_id: self.id, accepted: true)
    friended_friends = self.inverse_friendships.select(:id, :user_id)
                                     .where(friend_id: self.id, accepted:true)

    (get_users_with(friends_friended) + get_users_with(friended_friends))

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

    def get_users_with(ids)
      ids.each_with_object([]) do |friend, arr|
        arr << User.find(value_from(friend))
      end
    end

    def value_from(model)
      model.has_attribute?("user_id") ? model.user_id : model.friend_id
    end

end
