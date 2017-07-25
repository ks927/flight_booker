require 'test_helper'

class AirportTest < ActiveSupport::TestCase
    
  def setup
    @phi = airports(:phi)
    @lax = airports(:lax)
  end
    
  test "valid airport" do
     assert @phi.valid?
  end
    
  test "has departing_flights" do
     assert_equal 1, @phi.departing_flights.size
  end
    
  test "has arriving_flights" do
     assert_equal 1, @lax.arriving_flights.size
  end
    
end
