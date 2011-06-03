require 'spec_helper'

describe GooglePlacesAutocomplete::Client do
  use_vcr_cassette 'autocomplete'
  
  it 'should not initialize without an api_key' do
    lambda { GooglePlacesAutocomplete::Client.new }.should raise_error
  end

  it 'should initialize with an api_key' do
    @client = GooglePlacesAutocomplete::Client.new(:api_key => "foobar")
    @client.api_key.should == "foobar"
  end

  it 'should request autocomplete' do    
    @client = GooglePlacesAutocomplete::Client.new(:api_key => "foobar")
    @autocomplete = @client.autocomplete(:input => "Paris", :types => "geocode")
    @autocomplete.predictions.size.should == 5
    @autocomplete.predictions.first.description.should == 'Paris, France'
  end
end