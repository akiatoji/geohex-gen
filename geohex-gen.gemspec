# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'geohex/gen/version'

Gem::Specification.new do |spec|
  spec.name          = "geohex-gen"
  spec.version       = Geohex::Gen::VERSION
  spec.authors       = ["Aki Atoji"]
  spec.email         = ["akiatoji@gmail.com"]
  spec.summary       = %q{GeoHex generator command line utility}
  spec.description   = %q{This gem is a simple utility to generate one or more geohexes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'geo_hex'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
