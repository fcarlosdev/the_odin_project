class Event < ApplicationRecord

  scope :upcoming_events, -> { where("at_date >= :today", {today: Time.now.to_date}) }
  scope :previous_events, -> { where("at_date <  :today", {today: Time.now.to_date}) }

  belongs_to :creator, class_name: "User"
  has_many   :invitations, foreign_key: :attended_event_id
  has_many   :attendees, through: :invitations

  validates :title, presence: true
  validates :description, presence: true
  validates :at_date, presence: true

  def total_confirmations
    invitations.where(accepted: :true).count
  end

  def pending_invites_accept
    invitations.count - total_confirmations
  end

  def invites(status)
    invitations.where(accepted: status)
  end

end
