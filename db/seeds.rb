Airport.delete_all
["SFO", "JFK", "LAX", "MIA", "PHI"].each do |name|
    Airport.create!(name: name)
end


Flight.delete_all
Airport.all.each do |from_airport|
    Airport.all.each do |to_airport|
      unless from_airport == to_airport
        time = rand(1..10)
        4.times do 
        Flight.create!(from_airport_id: from_airport.id,
                        to_airport_id: to_airport.id,
                        date: (Date.today + rand(1..10).weeks).strftime("%m/%d/%Y"),
                        duration: 60 * time)
        end
      end
    end
end
