require_relative 'uia_base'

# Use these constant values when setting device orientation
UIA_DEVICE_ORIENTATION_UNKNOWN = 0
UIA_DEVICE_ORIENTATION_PORTRAIT = 1
UIA_DEVICE_ORIENTATION_PORTRAIT_UPSIDEDOWN = 2
UIA_DEVICE_ORIENTATION_LANDSCAPELEFT = 3
UIA_DEVICE_ORIENTATION_LANDSCAPERIGHT = 4
UIA_DEVICE_ORIENTATION_FACEUP = 5
UIA_DEVICE_ORIENTATION_FACEDOWN = 6
# Not defined in UIAutomation API reference. This is just a shorthand.
UIA_DEVICE_ORIENTATION_LANDSCAPE = UIA_DEVICE_ORIENTATION_LANDSCAPELEFT

class UIATarget < UIABase
  class << self
    def set_device_orientation(aOrientation)
      res = execute("target.setDeviceOrientation(#{aOrientation})")
      response(res)
    end

    def device_orientation
      res = execute('target.deviceOrientation()')
      response(res)
    end

    def deactivate_app_for_duration(aDuration=5)
      res = execute("target.deactivateAppForDuration(#{aDuration})")
      response(res)
    end

    alias_method :send_application_to_background, :deactivate_app_for_duration

    def drag_from_to_for_duration(aFromX, aFromY, aToX, aToY, aDuration=1)
      res = execute("target.dragFromToForDuration({x:#{aFromX}, y:#{aFromY}}, {x:#{aToX}, y:#{aToY}}, #{aDuration})")
      response(res)
    end

    alias_method :drag, :drag_from_to_for_duration

    def pinch_close_from_to_for_duration(aFromX, aFromY, aToX, aToY, aDuration=1)
      res = execute("target.pinchCloseFromToForDuration({x:#{aFromX}, y:#{aFromY}}, {x:#{aToX}, y:#{aToY}}, #{aDuration})")
      response(res)
    end

    alias_method :pinch_close, :pinch_close_from_to_for_duration

    def pinch_open_from_to_for_duration(aFromX, aFromY, aToX, aToY, aDuration=1)
      res = execute("target.pinchOpenFromToForDuration({x:#{aFromX}, y:#{aFromY}}, {x:#{aToX}, y:#{aToY}}, #{aDuration})")
      response(res)
    end

    alias_method :pinch_open, :pinch_open_from_to_for_duration

    def flick_from_to(aFromX, aFromY, aToX, aToY)
      res = execute("target.flickFromTo({x:#{aFromX}, y:#{aFromY}}, {x:#{aToX}, y:#{aToY}})")
      response(res)
    end

    alias_method :flick, :flick_from_to
  end
end
