# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zip-codes'

Gem::Specification.new do |spec|
  spec.name          = "zip-codes"
  spec.version       = ZipCodes::VERSION
  spec.authors       = ["Michał Duda"]
  spec.email         = ["michal.duda@monterail.com"]
  spec.description   = %q{Identify city and state for given zip code}
  spec.summary       = %q{Gem to identify zip codes inside US}
  spec.homepage      = "https://github.com/monterail/zip-codes"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
