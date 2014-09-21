require 'minitest/autorun'
require 'minitest/reporters'

require 'calios-uia-extension'

require_relative 'stubs/calabash_cucumber_core_stub'
require_relative 'stubs/calabash_cucumber_uia_stub'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
