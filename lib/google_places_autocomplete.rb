require 'rubygems'
require 'httparty'
require 'hashie'
require File.join(File.dirname(__FILE__), 'google_places_autocomplete', 'client')

module GooglePlacesAutocomplete
  def self.configure
    yield self
    true
  end

  class << self
    attr_accessor :api_key
  end
end

