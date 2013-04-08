require 'hay'

Hay.api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay do  
  # Authentication
  it "should throw an Authentication Error because of no API Key" do
    params = nil

    lambda {
      Hay.api_key = nil;
      Hay.request('get', '/customers', nil, params)  
    }.should raise_error(Hay::AuthenticationError, "No API key provided.")
  end

  it "should work with the API key in the args" do
    params = nil

    Hay.request('get', '/customers', '0E7LU4yW34Hj8amyLsxUzQ', params)  
  end

  # Invalid URL to Pin Payments API
  it "should throw an Invalid Request Error because of /cusotmers" do
    Hay.api_key = '0E7LU4yW34Hj8amyLsxUzQ'
    params = nil

    lambda {
      Hay.request('get', '/cusotmers', nil, params)  
    }.should raise_error(Hay::InvalidRequestError, "No resource was found at this URL. See https://pin.net.au/docs/api for API documentation and a list of valid URLs.")
  end


end