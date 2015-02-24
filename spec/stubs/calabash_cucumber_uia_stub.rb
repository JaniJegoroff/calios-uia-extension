# rubocop:disable Style/GlobalVars

require 'calabash-cucumber/uia'

# Stub for Calabash
module Calabash
  # Stub for Cucumber
  module Cucumber
    # Stub for UIA
    module UIA
      def uia(command, options = {})
        $uia_command = command
        $uia_opts = options
        $stub_uia_response
      end
    end
  end
end

# Just for including Calabash::Cucumber::UIA stub
class CalabashCucumberUIAStubClass
  include Calabash::Cucumber::UIA
end
