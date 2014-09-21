require_relative 'spec_helper'

class SpecUIABase < Minitest::Spec
  before do
    $uia_command = nil
    $uia_opts = nil
  end

  after do
    # nop
  end

  describe 'UIABase' do
    classes = [UIAAlert, UIAPopover]
    classes.each do |klass|
      describe "#{klass}.execute" do
        it 'should call Calabash uia method with correct parameters' do
          command = 'uia.alert() != null'
          klass.execute(command)
          $uia_command.must_equal(command)
        end
      end

      describe "#{klass}.response" do
        it "should return 'value' from response hash" do
          $stub_uia_response =
            {
              'status' => 'success',
              'value' => true,
              'index' => 19
            }

          command = 'uia.alert() != null'
          res = klass.execute(command)
          $uia_command.must_equal(command)
          klass.response(res).must_equal(true)
        end
      end

      describe "#{klass}.response?" do
        it "should return 'value' converted to boolean from response hash" do
          $stub_uia_response =
              {
                  'status' => 'success',
                  'value' => ':nil',
                  'index' => 19
              }

          command = 'uia.window().popover().isVisible()'
          res = klass.execute(command)
          $uia_command.must_equal(command)
          klass.response?(res).must_equal(false)
        end
      end
    end
  end
end
