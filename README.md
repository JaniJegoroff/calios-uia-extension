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

See available methods for a certain metaclass

> **`UIAAlert.help`**

Run the tests
==========

`$ bundle`

`$ rake`

License
==========

MIT
