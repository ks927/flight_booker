class Flight < ApplicationRecord
    belongs_to :from_airport, :class_name => "Airport"
    belongs_to :to_airport, :class_name => "Airport"
    
    validates :date, presence: true
    
    # Retrieve dates and change to in M/D/Y format
    def self.get_dates
        flights = Flight.all
        flights.map { |f| f.date.strftime("%m/%d/%Y") }.uniq
    end
    
end
