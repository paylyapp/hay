require 'hay'

Hay.api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay::Charges do
  it "create charge" do
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

    Hay::Charges.create('0E7LU4yW34Hj8amyLsxUzQ', options)
  end

  it "list charges" do
    Hay::Charges.list('0E7LU4yW34Hj8amyLsxUzQ')
  end

  it "search for charges" do
    options = {
      'query' => 'test+charge'
    }

    Hay::Charges.search('0E7LU4yW34Hj8amyLsxUzQ', options)
  end

  it "show charge" do
    Hay::Charges.show('0E7LU4yW34Hj8amyLsxUzQ', 'ch_VaF08F5DVvvoPImxh9cq9g')
  end
end