# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yadi/version'

Gem::Specification.new do |spec|
  spec.name          = 'yadi'
  spec.version       = Yadi::VERSION.dup
  spec.authors       = ['Roman Exempliarov']
  spec.email         = ['rexe@ya.ru']
  spec.license       = 'MIT'

  spec.summary       = 'Yet another dependency injection container'
  spec.homepage      = 'https://github.com/appelsin/yadi'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  # spec.add_runtime_dependency '', '>= 0.3.4'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end