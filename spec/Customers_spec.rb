require 'hay'

api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay::Customers do
  it "create customer" do
    options = {
      'email'=>'tim.j.gleeson@gmail.com',
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

    Hay::Customers.create(api_key, options)
  end

  it "list customers" do
    Hay::Customers.list(api_key)
  end

  it "show customer" do
    Hay::Customers.show(api_key,'cus_IS0qzTjW5pj_dkdHL3nvrw')
  end

  it "show customer charges" do
    Hay::Customers.show_charges(api_key,'cus_IS0qzTjW5pj_dkdHL3nvrw')
  end
end