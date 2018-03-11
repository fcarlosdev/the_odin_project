class FlightController < ApplicationController

  def index
    @from_airport_options = airport_options
    @to_airport_options   = airport_options
    @flights              = Flight.all
    @passangers_option    = [1,2,3,4]
    @dates_options        = available_dates
  end

  private

  def airport_options
    Airport.all.map{|airport| [airport_name(airport), airport.id]}
  end

  def airport_name(airport)
    airport.code + " - " + airport.name
  end

  def available_dates
    dates = @flights.order(start_date: :asc)
    dates.map{|date| date.start_date.strftime("%d/%m/%Y")}.uniq
  end

end
