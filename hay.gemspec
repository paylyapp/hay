# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hay/version'

Gem::Specification.new do |spec|
  spec.name          = "hay"
  spec.version       = Hay::VERSION
  spec.authors       = ["Tim Gleeson"]
  spec.email         = ["tim.j.gleeson@gmail.com"]
  spec.description   = "Provide interface to Pin Payments"
  spec.summary       = "Pin Payments interface"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('rest-client', '~> 1.4')
  spec.add_dependency('multi_json', '>= 1.0.4', '< 2')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec", "~> 2.6"
end
