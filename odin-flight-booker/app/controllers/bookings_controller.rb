class BookingsController < ApplicationController

  def new
    @flight  = Flight.find(params[:flight_id])
    @booking = Booking.new
    params[:num_seats].to_i.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      PassengerMailer.thank_you_email(@booking.passengers[0]).deliver
      decrease_total_seats
      flash[:success] = "Booking registered with success!!!!"
      redirect_to booking_path(@booking)
    else
      @flight = Flight.find(params[:flight_id])
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end

  def decrease_total_seats
    @booking.flight.update_attribute(:total_seats, (@booking.flight.total_seats - 1))
  end

end
