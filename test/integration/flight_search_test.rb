require 'test_helper'

class FlightSearchTest < ActionDispatch::IntegrationTest
    
  def setup
     @flight = flights(:one) 
  end

  test "should use params to find available flights" do
     get flights_url
     assert_select 'div.search'
     #get flights_path, params: { flight: { from_airport: "SFO", to_airport: "JFK", date: "2017-07-19 23:59:59", passengers: 1 }}
     #assert_select 'div.available'
  end
end
