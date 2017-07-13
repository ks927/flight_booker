class FlightsController < ApplicationController
    
    def index
        @flights = Flight.all
        @from_options = @flights.map { |f| f.from_airport }.uniq
        @to_options = @flights.map { |f| f.to_airport }.uniq
        @dates = @flights.get_dates
    end
end
