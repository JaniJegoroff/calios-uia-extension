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
  end
end
