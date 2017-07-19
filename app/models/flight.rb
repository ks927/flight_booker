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
        flights.map { |f| f.date.strftime('%b %d, %Y') }.uniq
    end
    
    # Query database with params info
    def self.search_flights(from_airport, to_airport, date)
        where(from_airport_id: from_airport, to_airport_id: to_airport, date: Flight.parse_date(date))
        
    end
    
    # Parse a string date into a range object representing the whole day
    def self.parse_date(date)
      datetime = date.to_datetime
      datetime.beginning_of_day..datetime.end_of_day
    end
    
    def format_duration
       if duration % 60 != 0
           "#{duration/60} hours #{duration%60} minutes"
        else
           "#{duration/60} hours"
       end
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

=begin
date = params[:date]
       from_airport = Airport.find_by_name( params[:from_airport])
       to_airport = Airport.find_by_name( params[:to_airport])
=end