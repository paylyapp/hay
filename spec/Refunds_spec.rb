require 'hay'

Hay.api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay::Refunds do
  it "should be able to refund a valid charge" do
    options = {
      'amount' => 400,
      'currency'=>'AUD',
      'description'=>'test charge',
      'email'=>'tim.j.gleeson@gmail.com',
      'ip_address'=>'203.192.1.172',
      'card' => {
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
    }
    charge = Hay::Charges.create(nil, options)

    Hay::Refunds.create(nil, charge[:response][:token])
  end

  it "should throw an error on an invalid charge" do
    lambda {
      Hay::Refunds.create(nil, 'invalid_charge')  
    }.should raise_error(Hay::InvalidRequestError, 'The requested resource could not be found.')
  end

  it "show charge" do
    Hay::Refunds.list(nil, 'ch_VaF08F5DVvvoPImxh9cq9g')
  end
end