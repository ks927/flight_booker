class BookingsController < ApplicationController
    
  def new
      @booking = Booking.new
      @flight = Flight.find(params[:booking][:flight_id])
  end
    
end
