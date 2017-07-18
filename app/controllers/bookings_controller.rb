class BookingsController < ApplicationController
    
  def new
      @number = params[:passengers].to_i
      @number.times { @booking.passengers.build }
      @flight = Flight.find(params[:flight_id])
      @booking = Booking.new
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