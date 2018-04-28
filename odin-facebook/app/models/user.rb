class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name,  presence: true
  validates :last_name,  presence: true

  has_many :posts
  has_many :comments

  has_one :profile, dependent: :destroy

  def fullname
    first_name + last_name
  end

end
