class FlightsController < ApplicationController
    
    def index
        @flights = Flight.all
        @from_options = @flights.map { |f| f.from_airport }.uniq
        @to_options = @flights.map { |f| f.to_airport }.uniq
        @dates = @flights.get_dates
        
        # handle params from form
        search_flights if params[:commit]
            
    end
        
    private
        
    def search_flights
       @avail_flights = Flight.search_results(params[:flight][:from_airport], params[:flight][:to_airport], params[:flight][:date].to_date)
       flash[:danger] = "Choose a different airport!" if params[:flight][:from_airport] == params[:flight][:to_airport]
    end
end
