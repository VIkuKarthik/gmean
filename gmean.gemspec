
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gmean/version"

Gem::Specification.new do |spec|
  spec.name          = "gmean"
  spec.version       = Gmean::VERSION
  spec.authors       = "ViKraM"
  spec.email         = "vikramank316@gmail.com"

  spec.summary       = %q{Get the Meaning of the Word.}
  spec.description   = %q{Get the Meaning of the Word by scraping.}
  spec.homepage      = "https://github.com/vikukarthik"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["gmean"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.8'
end
