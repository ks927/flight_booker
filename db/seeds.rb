Airport.delete_all
["SFO", "JFK", "LAX", "MIA", "PHI"].each do |name|
    Airport.create!(name: name)
end

Flights.delete_all
