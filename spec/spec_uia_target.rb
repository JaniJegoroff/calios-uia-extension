# rubocop:disable Style/GlobalVars
# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/LineLength

require_relative 'spec_helper'

# Test class for UIATarget
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

      describe 'UIATarget.deactivate_app_for_duration and alias methods' do
        it 'should call Calabash uia command with correct parameters and return correct response' do
          $stub_uia_response =
            {
              'status' => 'success',
              'value' => true,
              'index' => 0
            }

          res = UIATarget.deactivate_app_for_duration
          # $uia_command.must_equal('target.deactivateAppForDuration(5)')
          $uia_command.must_equal('var x = target.deactivateAppForDuration(5); var MAX_RETRY = 5, retries = 0; while (!x && retries < MAX_RETRY) { x = target.deactivateAppForDuration(5); retries += 1}; x')
          res.must_equal(true)

          res = UIATarget.deactivate_app_for_duration(10)
          # $uia_command.must_equal('target.deactivateAppForDuration(10)')
          $uia_command.must_equal('var x = target.deactivateAppForDuration(10); var MAX_RETRY = 5, retries = 0; while (!x && retries < MAX_RETRY) { x = target.deactivateAppForDuration(10); retries += 1}; x')
          res.must_equal(true)

          res = UIATarget.send_application_to_background
          # $uia_command.must_equal('target.deactivateAppForDuration(5)')
          $uia_command.must_equal('var x = target.deactivateAppForDuration(5); var MAX_RETRY = 5, retries = 0; while (!x && retries < MAX_RETRY) { x = target.deactivateAppForDuration(5); retries += 1}; x')
          res.must_equal(true)

          res = UIATarget.send_application_to_background(10)
          # $uia_command.must_equal('target.deactivateAppForDuration(10)')
          $uia_command.must_equal('var x = target.deactivateAppForDuration(10); var MAX_RETRY = 5, retries = 0; while (!x && retries < MAX_RETRY) { x = target.deactivateAppForDuration(10); retries += 1}; x')
          res.must_equal(true)
        end
      end

      describe 'UIATarget.drag_from_to_for_duration and alias methods' do
        it 'should call Calabash uia command with correct parameters and return correct response' do
          $stub_uia_response =
            {
              'status' => 'success',
              'value' => ':nil',
              'index' => 0
            }

          UIATarget.drag_from_to_for_duration(100, 100, 200, 200, 3)
          $uia_command.must_equal('target.dragFromToForDuration({x:100, y:100}, {x:200, y:200}, 3)')

          UIATarget.drag(300, 300, 400, 400, 5)
          $uia_command.must_equal('target.dragFromToForDuration({x:300, y:300}, {x:400, y:400}, 5)')
        end
      end

      describe 'UIATarget.pinch_close_from_to_for_duration and alias methods' do
        it 'should call Calabash uia command with correct parameters and return correct response' do
          $stub_uia_response =
            {
              'status' => 'success',
              'value' => ':nil',
              'index' => 0
            }

          UIATarget.pinch_close_from_to_for_duration(100, 100, 200, 200, 3)
          $uia_command.must_equal('target.pinchCloseFromToForDuration({x:100, y:100}, {x:200, y:200}, 3)')

          UIATarget.pinch_close(300, 300, 400, 400, 5)
          $uia_command.must_equal('target.pinchCloseFromToForDuration({x:300, y:300}, {x:400, y:400}, 5)')
        end
      end

      describe 'UIATarget.pinch_open_from_to_for_duration and alias methods' do
        it 'should call Calabash uia command with correct parameters and return correct response' do
          $stub_uia_response =
            {
              'status' => 'success',
              'value' => ':nil',
              'index' => 0
            }

          UIATarget.pinch_open_from_to_for_duration(100, 100, 200, 200, 3)
          $uia_command.must_equal('target.pinchOpenFromToForDuration({x:100, y:100}, {x:200, y:200}, 3)')

          UIATarget.pinch_open(300, 300, 400, 400, 5)
          $uia_command.must_equal('target.pinchOpenFromToForDuration({x:300, y:300}, {x:400, y:400}, 5)')
        end
      end

      describe 'UIATarget.flick_from_to and alias methods' do
        it 'should call Calabash uia command with correct parameters and return correct response' do
          $stub_uia_response =
            {
              'status' => 'success',
              'value' => ':nil',
              'index' => 0
            }

          UIATarget.flick_from_to(100, 100, 200, 200)
          $uia_command.must_equal('target.flickFromTo({x:100, y:100}, {x:200, y:200})')

          UIATarget.flick(300, 300, 400, 400)
          $uia_command.must_equal('target.flickFromTo({x:300, y:300}, {x:400, y:400})')
        end
      end
    end
  end
end
