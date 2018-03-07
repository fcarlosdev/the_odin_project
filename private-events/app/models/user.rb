class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
  has_many :invitations, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :invitations, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
