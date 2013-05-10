require 'hay'

Hay.api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay::CardToken do
  it "create card token" do
    options = {
      'number' => 5520000000000000,
      'expiry_month' => 05,
      'expiry_year' => 2013,
      'cvc' => 123,
      'name' => 'Roland Robot',
      'address_line1' => '42 Sevenoaks St',
      'address_line2' => '',
      'address_city' => 'Lathlain',
      'address_postcode' => 6454,
      'address_state' => 'WA',
      'address_country' => 'Australia'
    }

    card_token = Hay::CardToken.create(nil, options)
  end

  it "should throw API Error if incorrect Card Number is given" do
    options = {
      'number' => 5520000000000001,
      'expiry_month' => 05,
      'expiry_year' => 2013,
      'cvc' => 123,
      'name' => 'Roland Robot',
      'address_line1' => '42 Sevenoaks St',
      'address_line2' => '',
      'address_city' => 'Lathlain',
      'address_postcode' => 6454,
      'address_state' => 'WA',
      'address_country' => 'Australia'
    }
    
    lambda {
      Hay::CardToken.create(nil, options)
    }.should raise_error(Hay::APIError, "One or more parameters were missing or invalid.")
  end

  it "should throw API Error if past month is given" do
    options = {
      'number' => 5520000000000001,
      'expiry_month' => 03,
      'expiry_year' => 2013,
      'cvc' => 123,
      'name' => 'Roland Robot',
      'address_line1' => '42 Sevenoaks St',
      'address_line2' => '',
      'address_city' => 'Lathlain',
      'address_postcode' => 6454,
      'address_state' => 'WA',
      'address_country' => 'Australia'
    }
    
    lambda {
      Hay::CardToken.create(nil, options)
    }.should raise_error(Hay::APIError, "One or more parameters were missing or invalid.")
  end

  it "should throw an Invalid Resource Error because there were no card details in the options" do
    api_key = '0E7LU4yW34Hj8amyLsxUzQ'
    options = {}

    lambda {
      Hay::CardToken.create(nil, options)
    }.should raise_error(Hay::APIError, "One or more parameters were missing or invalid.")
  end
end