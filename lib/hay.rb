require 'rest_client'
require 'multi_json'

require "hay/version"

require "hay/json"
require "hay/util"

require "hay/Charges"
require "hay/Customers"
require "hay/Refunds"
require "hay/CardToken"

require "hay/errors"

module Hay
  def self.request(method, uri, api_key, params) 
    url = 'https://test-api.pin.net.au/1'+uri

    opts = {
      :method => method,
      :url => url,
      :open_timeout => 30,
      :payload => params,
      :timeout => 80,
      :user => api_key
    }

    begin
      response = RestClient::Request.execute(opts)
    rescue SocketError => e
      self.handle_restclient_error(e)
    rescue NoMethodError => e
      if e.message =~ /\WRequestFailed\W/
        e = APIConnectionError.new('Unexpected HTTP response code')
        self.handle_restclient_error(e)
      else
        raise
      end
    rescue RestClient::ExceptionWithResponse => e
      if rcode = e.http_code and rbody = e.http_body
        self.handle_api_error(rcode, rbody)
      else
        self.handle_restclient_error(e)
      end
    rescue RestClient::Exception, Errno::ECONNREFUSED => e
      self.handle_restclient_error(e)
    end
    
    rbody = response.body
    rcode = response.code
    begin
      resp = Hay::JSON.load(rbody)
    rescue MultiJson::DecodeError
      raise APIError.new("Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})", rcode, rbody)
    end
    resp
  end

  def self.handle_api_error(rcode, rbody)
    begin
      error_obj = Hay::JSON.load(rbody)
      error_obj = Util.symbolize_names(error_obj)
      error = error_obj[:error] or raise HayError.new # escape from parsing
    rescue MultiJson::DecodeError, HayError
      raise APIError.new("Invalid response object from API: #{rbody.inspect} (HTTP response code was #{rcode})", rcode, rbody)
    end

    case rcode
    when 400, 404 then
      raise InvalidRequestError.new(error_obj[:error_description], error_obj[:messages], rcode, rbody, error_obj)
    when 401
      raise AuthenticationError.new(error_obj[:error_description], rcode, rbody, error_obj)
    when 402
      raise CardError.new(error[:messages], error[:error], error[:error], rcode, rbody, error_obj)
    else
      raise APIError.new(error_obj[:error_description], rcode, rbody, error_obj)
    end
  end

  def self.handle_restclient_error(e)
    case e
    when RestClient::ServerBrokeConnection, RestClient::RequestTimeout
      message = "Couldn't connect to Pin Payments"
    when RestClient::SSLCertificateNotVerified
      message = "Couldn't verify Pin Payments SSL"
    when SocketError
      message = "Unexpected error communicating when trying to connect to Pin Payments."
    else
      message = "Unexpected error communicating with Pin Payments."
    end
    message += "\n\n(Network error: #{e.message})"
    raise APIConnectionError.new(message)
  end
end
