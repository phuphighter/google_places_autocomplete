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
      sensor = options.delete(:sensor) || false
      types  = options.delete(:types)
      language  = options.delete(:language) || nil
      input  = options.delete(:input)
      offset = options.delete(:offset) || nil
      radius = options.delete(:radius) || nil
      lat = options.delete(:lat) || nil
      lng = options.delete(:lng) || nil
      location = [lat,lng].join(',') if lat && lng
      sw_bounds = [options[:sw_bounds].delete(:lat),options[:sw_bounds].delete(:lng)].join(',') if options[:sw_bounds] && options[:sw_bounds][:lat] && options[:sw_bounds][:lng]
      ne_bounds = [options[:ne_bounds].delete(:lat),options[:ne_bounds].delete(:lng)].join(',') if options[:ne_bounds] && options[:ne_bounds][:lat] && options[:ne_bounds][:lng]
      bounds = [sw_bounds,ne_bounds].join('|') if sw_bounds && ne_bounds
      
      options = {
        :location => location,
        :radius => radius,
        :language => language,
        :sensor => sensor,
        :input => input,
        :offset => offset,
        :bounds => bounds
      }
      
      if types
        types = (types.is_a?(Array) ? types.join('|') : types)
        options.merge!(:types => types)
      end
      
      options = options.delete_if {|key, value| value.nil?}
      mashup(self.class.get("/json", :query => options.merge(self.default_options)))
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
