# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zip-codes'

Gem::Specification.new do |spec|
  spec.name          = 'zip-codes'
  spec.version       = ZipCodes::VERSION
  spec.authors       = ['Michał Duda']
  spec.email         = ['michal.duda@monterail.com']
  spec.description   = %s(Simple gem to get city, state, and time zone for a given zip code)
  spec.summary       = %s(Gem to identify zip codes inside US)
  spec.homepage      = 'https://github.com/monterail/zip-codes'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.0.0'

  spec.add_development_dependency 'rake', '~> 13.0.0'
  spec.add_development_dependency 'rubocop', '~> 1.39.0'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
end
