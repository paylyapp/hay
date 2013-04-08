require 'hay'

api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay do
  it "should throw an Invalid Request Error because of /cusotmers" do
    params = nil

    lambda {
      Hay.request('get', '/cusotmers', api_key, params)  
    }.should raise_error(Hay::InvalidRequestError, "No resource was found at this URL. See https://pin.net.au/docs/api for API documentation and a list of valid URLs.")
  end
end