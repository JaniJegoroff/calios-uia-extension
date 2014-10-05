include Calabash::Cucumber::Core

#
# Base class for UIA commands
#
class UIABase
  class << self
    def execute(aCommand)
      Calabash::Cucumber::UIA.uia(aCommand)
    end

    def response(aHash)
      aHash['value']
    end

    def response?(aHash)
      response(aHash).to_boolean
    end

    def help
      public_methods(false)
    end

    alias_method :h, :help
  end
end
