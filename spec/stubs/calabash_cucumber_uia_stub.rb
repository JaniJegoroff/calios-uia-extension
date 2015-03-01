require 'calabash-cucumber/uia'

# Stub for Calabash
module Calabash
  # Stub for Cucumber
  module Cucumber
    # Stub for UIA
    module UIA
      attr_accessor :command
      attr_accessor :opts
      attr_accessor :response

      def uia(command, options = {})
        @command = command
        @opts = options
        @response = response
      end
    end
  end
end
