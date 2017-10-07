# coding: utf-8
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))

require 'cloth/version'

Gem::Specification.new do |spec|
  spec.name          = "cloth"
  spec.version       = Cloth::VERSION
  spec.authors       = ["Kristian Freeman"]
  spec.email         = ["kristian@bytesized.xyz"]

  spec.summary       = %q{The Ruby bindings for the Cloth API.}
  spec.description   = %q{Give your users what they want. https://cloth.network}
  spec.homepage      = "https://cloth.network"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*.rb']
  spec.test_files    = `git ls-files -- test/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "typhoeus", "~> 1.3.0"
end
