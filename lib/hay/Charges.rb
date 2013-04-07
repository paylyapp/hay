module Hay
  class Charges
    def self.create(api_key, params = {})
      Hay.request('post', '/charges', api_key, params)
    end

    def self.list(api_key, params = {})
      Hay.request('get', '/charges', api_key, params)
    end

    def self.search(api_key, params = {})
      Hay.request('get', '/charges/search', api_key, params)
    end

    def self.show(api_key, charges_token, params = {})
      Hay.request('get', '/charges/'+charges_token, api_key, params)
    end
  end
end