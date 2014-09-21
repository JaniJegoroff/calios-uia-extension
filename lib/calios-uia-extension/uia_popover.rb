require_relative 'uia_base'

class UIAPopover < UIABase
  class << self
    def visible?
      res = execute('uia.window().popover().isVisible()')
      response?(res)
    end

    def not_visible?
      not self.visible?
    end

    def dismiss
      execute('uia.window().popover().dismiss()')
    end
  end
end
