require_relative 'spec_helper'

class SpecUIAAlert < Minitest::Spec
  before do
    $uia_command = nil
    $uia_opts = nil
  end

  after do
    # nop
  end

  describe 'UIAAlert' do
    describe 'UIAAlert.visible?' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        $stub_uia_response =
          {
            'status' => 'success',
            'value' => true,
            'index' => 19
          }

        res = UIAAlert.visible?
        $uia_command.must_equal('uia.alert() != null')
        res.must_equal(true)
      end
    end

    describe 'UIAAlert.not_visible?' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        $stub_uia_response =
            {
              'status' => 'success',
              'value' => false,
              'index' => 19
            }

        res = UIAAlert.not_visible?
        $uia_command.must_equal('uia.alert() != null')
        res.must_equal(true)
      end
    end

    describe 'UIAAlert.confirm' do
      it 'should call Calabash uia command with correct parameters' do
        UIAAlert.confirm
        $uia_command.must_equal('uia.alert().buttons()[1].tap()')
      end
    end

    describe 'UIAAlert.cancel' do
      it 'should call Calabash uia command with correct parameters' do
        UIAAlert.cancel
        $uia_command.must_equal('uia.alert().buttons()[0].tap()')
      end
    end

    describe 'UIAAlert.button_count' do
      it 'should call Calabash uia command with correct parameters and return correct response' do
        $stub_uia_response =
          {
            'status' => 'success',
            'value' => [
              '[object UIAButton]',
              '[object UIAButton]'
            ],
            'index' => 6
          }

        res = UIAAlert.button_count
        $uia_command.must_equal('uia.alert().buttons()')
        res.must_equal(2)
      end
    end

    describe 'UIAAlert.tap' do
      it 'should raise if called with wrong parameter type' do
        proc { UIAAlert.tap(1) }.must_raise(RuntimeError)
        proc { UIAAlert.tap(:Symbol) }.must_raise(RuntimeError)
      end

      it 'should call Calabash uia command with correct parameters' do
        UIAAlert.tap('Cancel')
        $uia_command.must_equal("uia.alert().buttons()['Cancel'].tap()")
      end
    end
  end
end
