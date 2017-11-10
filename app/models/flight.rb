class Flight < ApplicationRecord
    belongs_to :from_airport, :class_name => "Airport"
    belongs_to :to_airport, :class_name => "Airport"
    
    has_many :bookings
    has_many :passengers, :through => :bookings
    
    validates :date, presence: true
    
    # Query database with params info
    def self.search_flights(from_airport, to_airport, date)
       where(from_airport_id: from_airport, to_airport_id: to_airport, date: Flight.parse_date(date))
        
    end
    
    # Parse a string date into a range object representing the whole day
    def self.parse_date(date)
      datetime = date.to_datetime
      datetime.beginning_of_day..datetime.end_of_day
    end
    
    # Change duration into hours and minutes
    def format_duration
       if duration % 60 != 0
           "#{duration/60} hours #{duration%60} minutes"
        else
           "#{duration/60} hours"
       end
    end
    
end