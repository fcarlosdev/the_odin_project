class Passenger < ApplicationRecord
  before_save {email.downcase!}
  belongs_to :booking

  validates :name,  presence: true
  validates :email, presence: true
end
