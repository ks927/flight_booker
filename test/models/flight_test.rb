require 'test_helper'

class FlightTest < ActiveSupport::TestCase
    
  def setup
     @flight = flights(:one) 
  end
    
  test "invalid flight without date" do  
     assert @flight.valid?
  end
    
  test "should have from_airport and to_airport" do
      assert_equal "PHI", @flight.from_airport.name
      assert_equal "LAX", @flight.to_airport.name
  end
    
  test "should have bookings" do
     assert_equal 2, @flight.bookings.size 
  end
end
