class Event < ApplicationRecord

  scope :upcoming_events, -> { where("at_date >= :today", {today: Time.now.to_date}) }
  scope :previous_events, -> { where("at_date <  :today", {today: Time.now.to_date}) }

  belongs_to :creator, class_name: "User"
  has_many   :invitations, foreign_key: :attended_event_id
  has_many   :attendees, through: :invitations

  def attendees_confirmations
    invitations.where(accepted: :true).count
  end

  def pending_invites_accept
    self.invitations.select{|invite| !invite.accepted?}.count
  end

end
