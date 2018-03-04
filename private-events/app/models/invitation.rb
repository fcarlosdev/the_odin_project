class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"

  def guest(id)
    User.find(id)
  end

end
