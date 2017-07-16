class Flight < ApplicationRecord
    belongs_to :from_airport, :class_name => "Airport"
    belongs_to :to_airport, :class_name => "Airport"
    
    has_many :bookings
    has_many :passengers, :through => :bookings
    
    validates :date, presence: true
    
    # Retrieve dates and change to in M/D/Y format
    def self.get_dates
        flights = Flight.all.order(date: :asc)
        flights.sort_by { |f| f.date }
        flights.map { |f| f.date }.uniq
    end
    
    # Query database with params info
    def self.search_flights(params)
       date = params[:date]
       from_airport = Airport.find_by_name( params[:from_airport])
       to_airport = Airport.find_by_name( params[:to_airport])
        Flight.where("from_airport_id = ? AND to_airport_id = ? AND date = ?", from_airport.id, to_airport.id, date)
        
    end
    
end

=begin
where("from_airport_id = ? AND to_airport_id = ? AND date = ? ", 
      from_airport, to_airport, DateTime.strptime(date, "%m/%d/%Y"))

where(from_airport_id: from_airport, to_airport_id: to_airport, date: DateTime.strptime(date, "%m/%d/%Y"))
=end

=begin
# Query db with params info
     def self.search_results(from_airport, to_airport, date)
       Flight.where("from_airport_id = ? AND to_airport_id = ? AND date = ?", 
      from_airport, to_airport, date)
    end
=end

=begin
# Query database with params info
    def self.search_flights(params)
       self.where(from_airport_id: params[:flight][:from_airport], to_airport_id: params[:flight][:to_airport], date: params[:flight][:date]) 
    end
=end