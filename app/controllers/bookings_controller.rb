class BookingsController < ApplicationController
    
  def new
      @flight = Flight.find(params[:flight_id])
      @booking = Booking.new
      @passenger = Passenger.new
      @number = params[:passengers].to_i
      @number.times { @booking.passengers.build } 
  end
    
  def create
     @booking = Booking.new(booking_params)
      if @booking.save
          flash[:success] = "Flight booked successfully!"
          redirect_to @booking
      end
  end
    
  def show 
      @booking = Booking.find(params[:id])
      
  end
    
    private
    
  def booking_params
     params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email]) 
  end
    
end