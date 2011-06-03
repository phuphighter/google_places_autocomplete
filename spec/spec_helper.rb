require 'rubygems'
require 'bundler/setup'
require 'vcr_setup'
require 'google_places_autocomplete'

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
end