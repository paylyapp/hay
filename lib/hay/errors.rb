module Hay
  class HayError < StandardError
    attr_reader :message
    attr_reader :http_status
    attr_reader :http_body
    attr_reader :json_body

    def initialize(message=nil, http_status=nil, http_body=nil, json_body=nil)
      @message = message
      @http_status = http_status
      @http_body = http_body
      @json_body = json_body
    end

    def to_s
      status_string = @http_status.nil? ? "" : "(Status #{@http_status}) "
      "#{status_string}#{@message}"
    end
  end

  class APIConnectionError < HayError
  end
  
  class APIError < HayError
  end
  
  class AuthenticationError < HayError
  end

  class InvalidRequestError < HayError
    attr_accessor :param

    def initialize(message, param, http_status=nil, http_body=nil, json_body=nil)
      super(message, http_status, http_body, json_body)
      @param = param
    end
  end

end