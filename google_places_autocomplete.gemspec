# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "google_places_autocomplete/version"

Gem::Specification.new do |s|
  s.name        = "google_places_autocomplete"
  s.version     = GooglePlacesAutocomplete::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Johnny Khai Nguyen"
  s.email       = "johnnyn@gmail.com"
  s.homepage    = "http://github.com/phuphighter/google_places_autocomplete"
  s.summary     = %q{Ruby wrapper for the Google Places Autocomplete API}
  s.description = %q{Use this gem to access the Google Places Autocomplete API from your Ruby application}

  s.rubyforge_project = "google_places_autocomplete"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'httparty', '0.13.7'
  s.add_dependency 'hashie'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'fakeweb'
  s.add_development_dependency 'vcr'
end
