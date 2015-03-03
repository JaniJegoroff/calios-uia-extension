# rubocop:disable Style/AccessorMethodName
# rubocop:disable Metrics/ParameterLists

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

#
# Provides handling for UIATarget commands
#
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

    def deactivate_app_for_duration(aDuration = 5)
      # res = execute("target.deactivateAppForDuration(#{aDuration})")

      # Workaround for https://github.com/JaniJegoroff/calios-uia-extension/issues/1
      # rubocop:disable Metrics/LineLength
      command = %[var x = target.deactivateAppForDuration(#{aDuration}); var MAX_RETRY = 5, retries = 0; while (!x && retries < MAX_RETRY) { x = target.deactivateAppForDuration(#{aDuration}); retries += 1}; x]
      # rubocop:enable Metrics/LineLength
      res = execute(command)

      response(res)
    end

    alias_method :send_application_to_background, :deactivate_app_for_duration

    def drag_from_to_for_duration(aFromX, aFromY, aToX, aToY, aDuration = 1)
      gesture_from_to_for_duration('dragFromToForDuration', aFromX, aFromY, aToX, aToY, aDuration)
    end

    alias_method :drag, :drag_from_to_for_duration

    def pinch_close_from_to_for_duration(aFromX, aFromY, aToX, aToY, aDuration = 1)
      gesture_from_to_for_duration('pinchCloseFromToForDuration', aFromX, aFromY, aToX, aToY, aDuration)
    end

    alias_method :pinch_close, :pinch_close_from_to_for_duration

    def pinch_open_from_to_for_duration(aFromX, aFromY, aToX, aToY, aDuration = 1)
      gesture_from_to_for_duration('pinchOpenFromToForDuration', aFromX, aFromY, aToX, aToY, aDuration)
    end

    alias_method :pinch_open, :pinch_open_from_to_for_duration

    def flick_from_to(aFromX, aFromY, aToX, aToY)
      res = execute("target.flickFromTo({x:#{aFromX}, y:#{aFromY}}, {x:#{aToX}, y:#{aToY}})")
      response(res)
    end

    alias_method :flick, :flick_from_to

    private

    def gesture_from_to_for_duration(aGesture, aFromX, aFromY, aToX, aToY, aDuration)
      res = execute("target.#{aGesture}({x:#{aFromX}, y:#{aFromY}}, {x:#{aToX}, y:#{aToY}}, #{aDuration})")
      response(res)
    end
  end
end
