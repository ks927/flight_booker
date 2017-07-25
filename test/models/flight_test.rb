require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  test "invalid flight without date" do 
     flight = Flight.new(date: "") 
     assert_not flight.valid?
  end
    
end
