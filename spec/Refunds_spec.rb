require 'hay'

api_key = '0E7LU4yW34Hj8amyLsxUzQ'

describe Hay::Refunds do
  it "create refund" do
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
    charge = Hay::Charges.create(api_key, options)
    
    charge.each do |charge_key, charge_value|
      case (charge_key)
      when 'response'
        charge_value.each do |response_key, response_value|
          case (response_key)
          when 'token'
            Hay::Refunds.create(api_key, response_value)
          end
        end  
      end
    end
  end

  it "show charge" do
    Hay::Refunds.list(api_key, 'ch_VaF08F5DVvvoPImxh9cq9g')
  end
end