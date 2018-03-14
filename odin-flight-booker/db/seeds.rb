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

airports = Airport.all

def new_date(increment_by)
  Date.current().change(day: increment_by)
end

def new_time(increment_by)
  Time.now().advance(hours: increment_by)
end

80.times do |i|
  origin = airports[rand(0..2)]
  destiny = airports[rand(0..2)]
  while origin == destiny
    destiny = airports[rand(0..2)]
  end
  date = (i % 2 == 0) ? new_date(rand(1..2)) : Date.current
  puts "Creating the flight between #{origin.code} to #{destiny.code}"
  Flight.create!(from_airport_id: origin.id,
                 to_airport_id: destiny.id,
                 start_date: date,
                 start_hour: new_time(rand(1..30)),
                 duration: rand(1..30),
                 total_seats: rand(1..50))
end
