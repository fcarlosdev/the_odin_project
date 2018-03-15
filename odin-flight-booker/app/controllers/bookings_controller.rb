class BookingsController < ApplicationController

  def new
    @flight  = Flight.find(params[:flight_id])
    @booking = Booking.new
    params[:num_seats].to_i.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
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

end
