require 'calabash-cucumber/core'

# Stub for Calabash
module Calabash
  # Stub for Cucumber
  module Cucumber
    # Stub for Core
    module Core
    end
  end
end

# Just for including Calabash::Cucumber::Core and Calabash::Cucumber::UIA stub
class CalabashCucumberCoreStubClass
  include Calabash::Cucumber::Core
  include Calabash::Cucumber::UIA
end
