require 'test_helper'

class FlightsControllerTest < ActionDispatch::IntegrationTest
    
  def setup
     @flight = flights(:one) 
  end
  
  test "should get index page" do
     get flights_url
     assert_response :success
  end
    
  test "should use params to search for flights" do
     get flights_url, params: { flight: { from_airport: @flight.from_airport, to_airport: @flight.to_airport, date: @flight.date }}
     assert_response :success
  end
    
end
