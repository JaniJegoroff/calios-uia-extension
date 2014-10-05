require_relative 'lib/calios-uia-extension/version'

Gem::Specification.new do |gem|
  gem.name          = 'calios-uia-extension'
  gem.version       = CaliosUIAExtension::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ['Jani Jegoroff']
  gem.email         = ['jani.jegoroff@gmail.com']
  gem.summary       = 'Calabash-ios UIA extension.'
  gem.description   = 'Calabash-ios UIA extension provides convenient metaclasses for UIAutomation commands usage in Calabash.'
  gem.homepage      = 'http://github.com/JaniJegoroff/calios-uia-extension'
  gem.license       = 'MIT'

  gem.files         = Dir.glob('lib/**/*.rb')
  gem.require_paths = ['lib']

  gem.test_files    = Dir.glob('spec/**/*.rb')

  gem.add_runtime_dependency 'calabash-cucumber', '~> 0.9', '>= 0.9.169'
  gem.add_runtime_dependency 'to_boolean', '~> 1.0'

  gem.add_development_dependency 'rake', '~> 10.3'
  gem.add_development_dependency 'minitest', '~> 5.4'
  gem.add_development_dependency 'minitest-reporters', '~> 1.0'
  gem.add_development_dependency 'rubocop', '~> 0.26'
end
