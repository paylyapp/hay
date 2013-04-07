module Hay
  class Customers
    def self.create(api_key, options)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/customers', api_key
      private_resource.post options 
    end

    def self.show(api_key, customer_token)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/customers/'+customer_token, api_key
      private_resource.get
    end

    def self.list(api_key)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/customers/', api_key
      private_resource.get
    end
  end
end