class PassengerMailer < ApplicationMailer
    default from: 'noreply@flightbooker.com'
    
    def booking_email(passenger)
      @passenger = passenger
      @booking = @passenger.booking
      
      mail(to: @passenger.email, subject: 'Your booking information!')
    end
    
end
