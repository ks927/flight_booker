class FlightsController < ApplicationController
    
    def index
        @flights = Flight.all
        @from_options = @flights.map { |f| f.from_airport.name }.uniq
        @to_options = @flights.map { |f| f.to_airport.name }.uniq
        @dates = Flight.get_dates
        @passengers = [1,2,3,4]
        
        if params[:commit]
            search_results
        end
        
    end
    
    private
    
    def search_results
      date = params[:date]
      from_airport = Airport.find_by_name( params[:from_airport])
      to_airport = Airport.find_by_name( params[:to_airport])
      @avail_flights = Flight.search_flights(from_airport.id, to_airport.id, date) 
      if @avail_flights.blank?
        flash.now[:danger] = "Sorry no flights found."
      end 
    end
        
end
