require_relative 'spec_helper'

# Test class for UIAPopover
class SpecUIAPopover < Minitest::Spec
  before do
    @uia = Calabash::Cucumber::UIA
  end

  describe 'UIAPopover' do
    describe 'UIAPopover.visible?' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        @uia.response =
          {
            'status' => 'success',
            'value' => 1,
            'index' => 19
          }

        res = UIAPopover.visible?
        @uia.command.must_equal('uia.window().popover().isVisible()')
        res.must_equal(true)
      end
    end

    describe 'UIAPopover.not_visible?' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        @uia.response =
          {
            'status' => 'success',
            'value' => ':nil',
            'index' => 19
          }

        res = UIAPopover.not_visible?
        @uia.command.must_equal('uia.window().popover().isVisible()')
        res.must_equal(true)
      end
    end

    describe 'UIAPopover.dismiss' do
      it 'should call Calabash uia command with correct parameters' do
        UIAPopover.dismiss
        @uia.command.must_equal('uia.window().popover().dismiss()')
      end
    end
  end
end
