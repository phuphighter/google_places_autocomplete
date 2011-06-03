module GooglePlacesAutocomplete
  
  class Client
    include HTTParty
    base_uri "https://maps.googleapis.com/maps/api/place/autocomplete"
    format :json
    
    attr_reader :api_key
                
    def initialize(options={})
      @api_key = options[:api_key] || GooglePlaces.api_key
    end
    
    def autocomplete(options={})
      query = options.merge(self.default_options)
      mashup(self.class.get("/json", :query => query))
    end
    
    protected
    
    def default_options
      { :sensor => false, :key => @api_key }
    end
    
    def mashup(response)
      case response.code
        when 200
          if response.is_a?(Hash)
            Hashie::Mash.new(response)
          else
            if response.first.is_a?(Hash)
              response.map{|item| Hashie::Mash.new(item)}
            else
              response
            end
          end
        end
      end
    end

end
