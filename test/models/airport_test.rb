require 'test_helper'

class AirportTest < ActiveSupport::TestCase
    
  def setup
    @airport = airports(:phi)  
  end
    
  test "valid airport" do
     assert @airport.valid?
  end
    
  test "has departing_flights" do
     assert_equal 2, @airport.departing_flights.size
  end
    
  test "has arriving_flights" do
     assert_equal 2, @airport.departing_flights.size
  end
    
end
