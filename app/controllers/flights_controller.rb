class FlightsController < ApplicationController
    
    def index
        @flights = Flight.all
        @from_options = @flights.map { |f| f.from_airport }.uniq
        @to_options = @flights.map { |f| f.to_airport }.uniq
        @dates = @flights.get_dates
        
        # handle params from form
        if params[:commit]
            search_flights
        end
            
    end
        
    private
        
    def search_flights
       @avail_flights = Flight.where(from_airport_id: params[:flight][:from_airport], to_airport_id: params[:flight][:to_airport], date: Time.parse(params[:flight][:date]) )
       if params[:flight][:from_airport] == params[:flight][:to_airport]
          flash[:danger] = "Choose a different airport!"  
       end
       if @avail_flights.blank?
           @message = "Sorry no flights found. Try another date."
       end
    end
end

=begin
@avail_flights = Flight.where(from_airport_id: params[:flight][:from_airport], to_airport_id: params[:flight][:to_airport], date: params[:flight][:date] )
=end

=begin
Flight.search_results(params[:flight][:from_airport], params[:flight][:to_airport], params[:flight][:date].to_date)
=end
