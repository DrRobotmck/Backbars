# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backbars/version'

Gem::Specification.new do |spec|
  spec.name          = "backbars"
  spec.version       = Backbars::VERSION
  spec.authors       = ["DrRobotmck"]
  spec.email         = ["mckenneth.scott@icloud.com"]
  spec.summary       = %q{Configure Backbone and Handlebars with all dependencies}
  spec.description   = %q{Boilerplate Backbone and Handlebars installation}
  spec.homepage      = "https://github.com/DrRobotmck/Backbars"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "handlebars_assets"
  # spec.add_runtime_dependency "rails-assets-underscore"
  # spec.add_runtime_dependency "rails-assets-backbone"

  spec.add_development_dependency "bundler", "~> 1.6"
end
