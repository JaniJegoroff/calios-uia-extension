require_relative 'uia_base'

class UIAAlert < UIABase
  class << self
    def visible?
      res = execute('uia.alert() != null')
      response(res)
    end

    def not_visible?
      not self.visible?
    end

    def confirm
      execute('uia.alert().defaultButton().tap()')
    end

    def cancel
      execute('uia.alert().buttons()[0].tap()')
    end

    def button_count
      res = execute('uia.alert().buttons()')
      response(res).count
    end

    def tap(aButton)
      raise 'invalid parameter' unless aButton.is_a?(String)
      execute("uia.alert().buttons()['#{aButton}'].tap()")
    end
  end
end
