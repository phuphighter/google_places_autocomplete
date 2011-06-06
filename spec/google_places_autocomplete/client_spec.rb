require 'spec_helper'

describe GooglePlacesAutocomplete::Client do
  
  it 'should not initialize without an api_key' do
    lambda { GooglePlacesAutocomplete::Client.new }.should raise_error
  end

  it 'should initialize with an api_key' do
    @client = GooglePlacesAutocomplete::Client.new(:api_key => "foobar")
    @client.api_key.should == "foobar"
  end
  
  context "request an autocomplete" do
    use_vcr_cassette 'autocomplete'

    it 'should request autocomplete' do    
      @client = GooglePlacesAutocomplete::Client.new(:api_key => "foobar")
      @autocomplete = @client.autocomplete(:input => "Paris", :types => "geocode")
      @autocomplete.predictions.size.should == 5
      @autocomplete.predictions.first.description.should == 'Paris, France'
    end
  end
  
  context "request an autocomplete with bounds" do
    use_vcr_cassette 'with_bounds'

    it 'should request autocomplete with bounds parameter' do    
      @client = GooglePlacesAutocomplete::Client.new(:api_key => "AIzaSyA8TtA11BlJ1XWlMisoboZvjk24xHgHwX0")
      @autocomplete = @client.autocomplete(:input => "Peter Luger", :types => "establishment", 
                                           :sw_bounds => {:lat => 40.606654, :lng => -74.036865}, 
                                           :ne_bounds => {:lat => 40.744655, :lng => -73.831558})
      
      @autocomplete.predictions.size.should == 0
    end
  end
end