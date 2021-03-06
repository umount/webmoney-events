# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webmoney_events/version'

Gem::Specification.new do |spec|
  spec.name          = 'webmoney-events'
  spec.version       = WebmoneyEvents::VERSION
  spec.authors       = ['Denis Sobolev']
  spec.email         = ['dns.sobol@gmail.com']

  spec.summary       = 'WebMoney Events Ruby SDK'
  spec.description   = 'WebMoney Events Ruby SDK'
  spec.homepage      = 'https://github.com/umount/webmoney-events'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
