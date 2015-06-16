lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop/bitjourney/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubocop-bitjourney'
  spec.version       = RuboCop::Bitjourney::VERSION
  spec.authors       = ['Masahiro Ihara']
  spec.email         = ['ihara@bitjourney.com']

  spec.summary       = %q{Custom cop for bitjourney projects}
  spec.description   = %q{Custom cop for bitjourney projects}
  spec.homepage      = 'http://github.com/bitjourney/ruboty-bitjourney'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rubocop', '0.29.1' # fix the version, see https://github.com/nevir/rubocop-rspec/issues/38
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
