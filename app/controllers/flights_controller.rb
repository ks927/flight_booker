class FlightsController < ApplicationController
    
    def index
        @flights = Flight.all
        @from_options = @flights.map { |f| f.from_airport.name }.uniq
        @to_options = @flights.map { |f| f.to_airport.name }.uniq
        @dates = Flight.get_dates
        @passengers = [1,2,3,4]
        
        if params[:commit]
            date = params[:date]
            from_airport = Airport.find_by_name( params[:from_airport])
            to_airport = Airport.find_by_name( params[:to_airport])
           @avail_flights = Flight.search_flights(from_airport.id, to_airport.id, date) 
            if @avail_flights.blank?
                flash.now[:danger] = "Sorry no flights found."
            end
        end
        
    end
        
end

=begin
@avail_flights = Flight.where(from_airport_id: params[:flight][:from_airport], to_airport_id: params[:flight][:to_airport], date: params[:flight][:date] )
=end

=begin
Flight.search_results(params[:flight][:from_airport], params[:flight][:to_airport], params[:flight][:date].to_date)
=end

=begin
# Query database with params info
    def search_flights
       @avail_flights = Flight.where(from_airport_id: params[:flight][:from_airport], to_airport_id: params[:flight][:to_airport])
       if params[:flight][:from_airport] == params[:flight][:to_airport]
          flash[:danger] = "Choose a different airport!"  
       end
       if @avail_flights.blank?
           @message = "Sorry no flights found. Try another date."
       end
    end
=end
