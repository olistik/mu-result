
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mu/result/version'

Gem::Specification.new do |spec|
  spec.name          = 'mu-result'
  spec.version       = Mu::Result::VERSION
  spec.authors       = ['olistik']
  spec.email         = ['root@olisti.co']
  spec.license       = 'AGPL-3.0'

  spec.summary       = %q{μResult is a small Result object}
  spec.description   = %q{μ as in micro}
  spec.homepage      = 'https://github.com/olistik/mu-result'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.2'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
