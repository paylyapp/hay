require 'hay'

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

    Hay::Customers.create('0E7LU4yW34Hj8amyLsxUzQ', options)
  end

  it "show customer" do
    Hay::Customers.show('0E7LU4yW34Hj8amyLsxUzQ','cus_IS0qzTjW5pj_dkdHL3nvrw')
  end

  it "list customers" do
    Hay::Customers.list('0E7LU4yW34Hj8amyLsxUzQ')
  end
end