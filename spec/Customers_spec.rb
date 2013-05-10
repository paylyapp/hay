require 'hay'

Hay.api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay::Customers do
  it "create customer" do
    options = {
      'email'=>'tim.j.gleeson@gmail.com',
      'card' => {
        'number' => 5520000000000000,
        'expiry_month' => 05,
        'expiry_year' => 2013,
        'cvc' => 123,
        'name' => 'Tim gleeson',
        'address_line1' => '7 Braeside Crescent',
        'address_line2' => '',
        'address_city' => 'Campbelltown',
        'address_postcode' => 2560,
        'address_state' => 'NSW',
        'address_country' => 'Australia'
      }
    }

    Hay::Customers.create(nil, options)
  end

  it "list customers" do
    Hay::Customers.list(nil)
  end

  it "show customer" do
    Hay::Customers.show(nil,'cus_IS0qzTjW5pj_dkdHL3nvrw')
  end

  it "should update a customer" do
    options = {
      'email'=>'tim.j.gleeson@gmail.com',
      'card' => {
        'number' => 5520000000000000,
        'expiry_month' => 05,
        'expiry_year' => 2013,
        'cvc' => 123,
        'name' => 'Tim gleeson',
        'address_line1' => '10 Braeside Crescent',
        'address_line2' => '',
        'address_city' => 'Campbelltown',
        'address_postcode' => 2560,
        'address_state' => 'NSW',
        'address_country' => 'Australia'
      }
    }

    Hay::Customers.update(nil,'cus_IS0qzTjW5pj_dkdHL3nvrw', options)
  end

  it "show customer charges" do
    Hay::Customers.show_charges(nil,'cus_IS0qzTjW5pj_dkdHL3nvrw')
  end
end