class Event < ApplicationRecord

  scope :upcoming_events, -> { where("at_date >= :today", {today: Time.now.to_date}) }
  scope :previous_events, -> { where("at_date <  :today", {today: Time.now.to_date}) }

  belongs_to :creator, class_name: "User"
  has_many   :invitations, foreign_key: :attended_event_id
  has_many   :attendees, through: :invitations

end
