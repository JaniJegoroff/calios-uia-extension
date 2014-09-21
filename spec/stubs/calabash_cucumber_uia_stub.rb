require 'calabash-cucumber/uia'

module Calabash::Cucumber::UIA
  def uia(command,options={})
    $uia_command = command
    $uia_opts = options
    $stub_uia_response
  end
end

class CalabashCucumberUIAStubClass
  include Calabash::Cucumber::UIA
end
