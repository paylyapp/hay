module Hay
  class CardToken
    def self.create(api_key, params = {})
      Hay.request('post', '/cards', api_key, params)
    end
  end
end