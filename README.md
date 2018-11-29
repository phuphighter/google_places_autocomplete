# Google Places Autocomplete

Ruby wrapper for the [Google Places Autocomplete API](http://code.google.com/apis/maps/documentation/places/autocomplete.html).

## Installation

Inside your Gemfile:   
gem 'google_places_autocomplete'
    
## Get Google Places API credentials

Go here and activate it:   
[https://code.google.com/apis/console](https://code.google.com/apis/console)
    
## Usage

### Instantiate a client

    >> client = GooglePlacesAutocomplete::Client.new(:api_key => 'your_api_key')
    
#### Example

    >> autocomplete = client.autocomplete(:input => "Paris", :types => "geocode")
    >> autocomplete.predictions.first.description
    => "Paris, France"

Contact me if you have any suggestions and feel free to fork it!
