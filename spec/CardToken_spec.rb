require 'hay'

describe Hay::CardToken do
  it "does the card token url work" do
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

    Hay::CardToken.create('0E7LU4yW34Hj8amyLsxUzQ', options)
  end
end