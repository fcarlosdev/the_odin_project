class Invitation < ApplicationRecord

  scope :accepted_invitations, -> { where(accepted: true)}

  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"
end
