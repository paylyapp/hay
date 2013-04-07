module Hay
  class CardToken
    def self.create(api_key, options)
      private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1/cards', api_key
      private_resource.post options 
    end
  end
end