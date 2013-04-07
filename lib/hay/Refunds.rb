module Hay
  class Refunds
    def self.create(api_key, charges_token)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/charges/'+charges_token+'/refunds', api_key
      private_resource.post ''
    end

    def self.list(api_key, charges_token)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/charges/'+charges_token+'/refunds', api_key
      private_resource.get
    end
  end
end