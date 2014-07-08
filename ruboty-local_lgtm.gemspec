# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/local_lgtm/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-local_lgtm"
  spec.version       = Ruboty::LocalLgtm::VERSION
  spec.authors       = ["masayuki_oguni"]
  spec.email         = ["masayuki_oguni.dev@gmail.com"]
  spec.summary       = "An ruboty handler to LGTM local service."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
end
