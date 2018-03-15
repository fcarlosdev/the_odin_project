class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  validates :from_airport_id, presence: true
  validates :to_airport_id,   presence: true

  def self.available_dates
    Flight.all.order(start_date: :asc).
       map{|date| date.start_date.strftime("%d/%m/%Y")}.uniq
  end

  def self.search(origin, destiny, num_of_passengers, at_date)
    parameters = {from_airport_id: origin, to_airport_id: destiny}
    parameters[:start_date] = Flight.to_date(at_date) if !param_not_provided?(at_date)
    Flight.where(parameters).where("total_seats >= ?", num_of_passengers.to_i)
  end

  private

  def self.to_date(str_date)
    if !str_date.nil?
      str_date.to_date
    end
  end

  def self.param_not_provided?(param)
    param.nil? || param.empty?
  end

end
