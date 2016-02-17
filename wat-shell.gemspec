# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wat-shell'

Gem::Specification.new do |spec|
  spec.name          = "wat-shell"
  spec.version       = Wat::VERSION
  spec.authors       = ["Nick Johnstone"]
  spec.email         = ["ncwjohnstone@gmail.com"]

  spec.summary       = %q{Replace Ruby with Bash, because why not?}
  spec.description   = %q{Inspired by Gary Bernhardt's excellent wat talk.}
  spec.homepage      = "https://github.com:Widdershin/wat-shell"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = ["wat"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
