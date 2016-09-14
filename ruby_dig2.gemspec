# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_dig2/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby_dig2'
  spec.version       = RubyDig2::VERSION
  spec.authors       = ['Colin Kelley', 'Arthur Andersen']
  spec.email         = ['colin@invoca.com', 'aandersen@velalu.qa']
  spec.summary       = 'Enhanced Array#dig and Hash#dig implementation.'
  spec.homepage      = 'https://github.com/leoc/ruby_dig2'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
end
