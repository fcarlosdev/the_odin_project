class User < ApplicationRecord

  # Associations

  has_many :posts
  has_many :comments

  has_one :profile, dependent: :destroy

  # Validations

  validates :first_name,  presence: true
  validates :last_name,  presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Callbacks Function
  before_create :create_default_profile

  def fullname
    first_name + " " + last_name
  end

  private

    def create_default_profile
      self.build_profile({email_notification: false})
    end



end
