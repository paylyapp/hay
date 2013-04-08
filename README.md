# Hay

Provides a ruby wrapper for the Pin Payments API (http://www.pin.net.au)

## Installation

Add this line to your application's Gemfile:

    gem 'hay'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hay

## Usage

### Card Tokens
#### Create 
`params = {
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

Hay::CardToken.create(api_key, params)`

### Charges
#### Create
params = {
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

Hay::Charges.create(api_key, params)

#### List
Hay::Charges.list(api_key)

#### Search Charges
params = {
  'query' => 'test+charge'
}

Hay::Charges.search(api_key, params)

#### Show
Hay::Charges.show(api_key, charges_token, params)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
