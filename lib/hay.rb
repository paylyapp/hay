require 'rest_client'

require "hay/version"

require "hay/Charges"
require "hay/Customers"
require "hay/Refunds"
require "hay/CardToken"

module Hay
  # Your code goes here...
  def self.request(method, uri, api_key, params) 
    private_resource = RestClient::Resource.new 'https://test-api.pin.net.au/1'+uri, api_key
    if method == 'get' 
      private_resource.get params
    elsif method == 'post'
      private_resource.post params
    end
  end
end
