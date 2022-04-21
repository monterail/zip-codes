# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'zip-codes/version'

Gem::Specification.new do |spec|
  spec.name          = 'zip-codes'
  spec.version       = ZipCodes::VERSION
  spec.date = '2022-04-20'

  spec.authors       = ['Michał Duda', 'Third Party Transportation Systems LLC']
  spec.email         = ['michal.duda@monterail.com', 'hello@next-tms.com']

  spec.description   = 'Retrieve city, state, and time zone for a given ZIP code 🎉'
  spec.summary       = "Retrieve city, state, and time zone for a given ZIP code for those times when API's just aren’t doable 🎉"

  spec.homepage      = 'https://github.com/next-tms/zip-codes'

  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*']
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 6.0.0', '< 7.1'
  spec.add_dependency 'fastcsv', '~> 0.0.6'
end
