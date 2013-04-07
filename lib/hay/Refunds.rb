module Hay
  class Refunds
    def self.create(api_key, charges_token, params = {})
      Hay.request('post', '/charges/'+charges_token+'/refunds', api_key, params)
    end

    def self.list(api_key, charges_token, params = {})
      Hay.request('get', '/charges/'+charges_token+'/refunds', api_key, params)
    end
  end
end