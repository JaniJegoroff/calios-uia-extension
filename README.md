[![Gem Version](https://badge.fury.io/rb/calios-uia-extension.svg)](http://badge.fury.io/rb/calios-uia-extension)
[![Dependency Status](https://gemnasium.com/JaniJegoroff/calios-uia-extension.svg)](https://gemnasium.com/JaniJegoroff/calios-uia-extension)

calios-uia-extension
==========

Calabash-ios UIA extension provides convenient metaclasses for UIAutomation commands usage in Calabash.

You can utilise these classes in `calabash-ios console` as well as in your test automation code.

Installation
==========

In your Gemfile:

`gem 'calios-uia-extension'`

Install gem manually:

`$ gem install calios-uia-extension`

Supported UIA classes
==========

Currently small subset of UIA classes are supported. Supported UIA classes are:

`UIAAlert`
`UIAPopover`
`UIATarget`

See UIAutomation JavaScript Reference for details: [UIAutomation JavaScript Reference](https://developer.apple.com/library/ios/documentation/DeveloperTools/Reference/UIAutomationRef/_index.html)

Example use cases
==========

Launch calabash-ios console (irb)

`$ calabash-ios console`

Load calios-uia-extension

`irb> require 'calios-uia-extension'`

Launch your application

`irb> start_test_server_in_background`

Execute some example UIA commands

> **`UIAAlert.visible?`**

> **`UIAAlert.not_visible?`**

> **`UIAAlert.button_count`**

> **`UIAAlert.tap('Cancel')`**

> **`UIAPopover.visible?`**

> **`UIAPopover.not_visible?`**

> **`UIAPopover.dismiss`**

> **`UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_PORTRAIT)`**

> **`UIATarget.set_device_orientation(3)`**

> **`UIATarget.device_orientation`**

> **`UIATarget.deactivate_application_for_duration(10)`**

> **`UIATarget.send_application_to_background(10)`**

> **`UIATarget.drag_from_to_for_duration(100, 100, 200, 200, 3)`**

> **`UIATarget.pinch_close_from_to_for_duration(100, 100, 200, 200, 3)`**

> **`UIATarget.pinch_open_from_to_for_duration(100, 100, 200, 200, 3)`**

> **`UIATarget.flick_from_to(100, 100, 200, 200)`**

See available methods for a certain metaclass

> **`UIAAlert.help`**

Did you notice alias methods?

> **`UIATarget.deactivate_application_for_duration`** --> **`UIATarget.send_application_to_background`**

> **`UIATarget.drag_from_to_for_duration(100, 100, 200, 200, 3)`** --> **`UIATarget.drag(100, 100, 200, 200, 3)`**

> **`UIATarget.pinch_close_from_to_for_duration(100, 100, 200, 200, 3)`** --> **`UIATarget.pinch_close(100, 100, 200, 200, 3)`**

> **`UIATarget.pinch_open_from_to_for_duration(100, 100, 200, 200, 3)`** --> **`UIATarget.pinch_open(100, 100, 200, 200, 3)`**

> **`UIATarget.flick_from_to(100, 100, 200, 200)`** --> **`UIATarget.flick(100, 100, 200, 200)`**

Run the tests
==========

`$ bundle`

`$ rake`

License
==========

MIT
