# Airports
Airport.delete_all
[{code: "SFO", name: "San Francisco International Airport"},
 {code: "JFK", name: "John F. Kennedy International Airport"},
 {code: "LGA", name: "LaGuardia Airport"}].each do |airport|
  puts "Creating #{airport[:name]} airport."
  Airport.create(code: airport[:code], name: airport[:name])
end


# Flights
Flight.delete_all

departure_airports = Airport.all
arrive_airports    = Airport.all

def new_date(increment_by)
  Date.current().change(day: increment_by)
end

def new_time(increment_by)
  Time.now().advance(minutes: increment_by)
end

departure_airports.each do |from_airport|

  (arrive_airports - [from_airport]).each do |to_airport|
    puts "Creating the flight between #{from_airport.code} to #{to_airport.code}"
    Flight.create!(from_airport_id: from_airport.id,
                   to_airport_id: to_airport.id,
                   start_date: new_date(rand(1..10)),
                   start_hour: new_time(rand(1..10)),
                   duration: rand(1..10) )
  end

end
