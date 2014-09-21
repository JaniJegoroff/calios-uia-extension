require_relative 'spec_helper'

class SpecUIAPopover < Minitest::Spec
  before do
    $uia_command = nil
    $uia_opts = nil
  end

  after do
    # nop
  end

  describe 'UIAPopover' do
    describe 'UIAPopover.visible?' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        $stub_uia_response =
          {
            'status' => 'success',
            'value' => 1,
            'index' => 19
          }

        res = UIAPopover.visible?
        $uia_command.must_equal('uia.window().popover().isVisible()')
        res.must_equal(true)
      end
    end

    describe 'UIAPopover.not_visible?' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        $stub_uia_response =
            {
              'status' => 'success',
              'value' => ':nil',
              'index' => 19
            }

        res = UIAPopover.not_visible?
        $uia_command.must_equal('uia.window().popover().isVisible()')
        res.must_equal(true)
      end
    end

    describe 'UIAPopover.dismiss' do
      it 'should call Calabash uia command with correct parameters' do
        UIAPopover.dismiss
        $uia_command.must_equal('uia.window().popover().dismiss()')
      end
    end
  end
end
