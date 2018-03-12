class FlightsController < ApplicationController
  def index
    @from_airport_options = airport_options
    @to_airport_options   = airport_options
    @passangers_option    = [1,2,3,4]
    @dates_options        = Flight.available_dates

    @origin  = params[:from_airport_id]
    @destiny = params[:to_airport_id]
    @passangers = params[:passangers]
    @date_choosed = params[:departure_date]

    @flights = Flight.search(@origin, @destiny, @passangers, @date_choosed)
  end

  private

  def airport_options
    Airport.all.map{|airport| [airport_name(airport), airport.id]}
  end

  def airport_name(airport)
    airport.code + " - " + airport.name
  end

end
