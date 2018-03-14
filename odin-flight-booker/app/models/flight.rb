class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def self.available_dates
    Flight.all.order(start_date: :asc).
       map{|date| date.start_date.strftime("%d/%m/%Y")}.uniq
  end

  def self.search(origin, destiny, number_of_passengers, at_date)
    flights = Flight.where(from_airport_id: origin, to_airport_id: destiny,
                 start_date: Flight.to_date(at_date))
    flights.where("total_seats >= ?", number_of_passengers.to_i)
  end

  private

  def self.to_date(str_date)
    if !str_date.nil?
      str_date.to_date
    end
  end
end
