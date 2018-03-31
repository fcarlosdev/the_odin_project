class PassengerMailer < ApplicationMailer

  def thank_you_email(passenger)
    @passenger     = passenger
    @flight_number = @passenger.booking.flight_id
    @from_airport  = @passenger.booking.flight.from_airport.name
    @to_airport    = @passenger.booking.flight.to_airport.name
    @url           = "http://localhost:3000/"
    mail(to: @passenger.email, subject: 'Thank you, your booking was registered with success.')
  end

end
