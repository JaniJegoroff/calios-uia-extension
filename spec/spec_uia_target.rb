require_relative 'spec_helper'

class SpecUIATarget < Minitest::Spec
  before do
    $uia_command = nil
    $uia_opts = nil
  end

  after do
    # nop
  end

  describe 'UIATarget' do
    describe 'UIATarget.set_device_orientation' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        $stub_uia_response =
          {
            'status' => 'success',
            'value' => false,
            'index' => 4
          }

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_UNKNOWN)
        $uia_command.must_equal('target.setDeviceOrientation(0)')
        res.must_equal(false)

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_PORTRAIT)
        $uia_command.must_equal('target.setDeviceOrientation(1)')
        res.must_equal(false)

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_PORTRAIT_UPSIDEDOWN)
        $uia_command.must_equal('target.setDeviceOrientation(2)')
        res.must_equal(false)

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_LANDSCAPELEFT)
        $uia_command.must_equal('target.setDeviceOrientation(3)')
        res.must_equal(false)

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_LANDSCAPERIGHT)
        $uia_command.must_equal('target.setDeviceOrientation(4)')
        res.must_equal(false)

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_FACEUP)
        $uia_command.must_equal('target.setDeviceOrientation(5)')
        res.must_equal(false)

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_FACEDOWN)
        $uia_command.must_equal('target.setDeviceOrientation(6)')
        res.must_equal(false)

        res = UIATarget.set_device_orientation(UIA_DEVICE_ORIENTATION_LANDSCAPE)
        $uia_command.must_equal('target.setDeviceOrientation(3)')
        res.must_equal(false)
      end
    end

    describe 'UIATarget.device_orientation' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        $stub_uia_response =
          {
            'status' => 'success',
            'value' => 3,
            'index' => 5
          }

        res = UIATarget.device_orientation
        $uia_command.must_equal('target.deviceOrientation()')
        res.must_equal(3)
      end
    end
  end
end
