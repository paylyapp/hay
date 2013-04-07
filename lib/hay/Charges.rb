module Hay
  class Charges
    def self.create(api_key, options)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/charges', api_key
      private_resource.post options 
    end

    def self.list(api_key)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/charges/', api_key
      private_resource.get
    end

    def self.search(api_key, options)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/charges/search', api_key
      private_resource.get options
    end

    def self.show(api_key, charges_token)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/charges/'+charges_token, api_key
      private_resource.get
    end
  end
end