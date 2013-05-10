module Hay
  class Customers
    def self.create(api_key, params = {})
      Hay.request('post', '/customers', api_key, params)
    end

    def self.list(api_key, params = {})
      Hay.request('get', '/customers', api_key, params)
    end

    def self.show(api_key, customer_token, params = {})
      Hay.request('get', '/customers/'+customer_token, api_key, params)
    end

    def self.update(api_key, customer_token, params = {})
      Hay.request('put', '/customers/'+customer_token, api_key, params)
    end

    def self.show_charges(api_key, customer_token, params = {})
      Hay.request('get', '/customers/'+customer_token+'/charges', api_key, params)
    end
  end
end