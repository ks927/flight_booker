Airport.delete_all
["SFO", "JFK", "LAX", "MIA", "PHI"].each do |name|
    Airport.create!(name: name)
end


depart_dates = []
10.times do 
  depart_dates << Faker::Date.forward(30) 
end

Flight.delete_all
Airport.all.each do |from_airport|
    Airport.all.each do |to_airport|
      unless from_airport == to_airport
        depart_dates.each do |d|
        4.times do 
        Flight.create!(from_airport_id: from_airport.id,
                        to_airport_id: to_airport.id,
                        date: Faker::Time.between(d.beginning_of_day, d.end_of_day),
                        duration: 60 * rand(1..10))
        end
        end
      end
    end
end
