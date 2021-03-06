require_relative 'spec_helper'

# Test class for UIABase
class SpecUIABase < Minitest::Spec
  before do
    @uia = Calabash::Cucumber::UIA
  end

  describe 'UIABase' do
    classes = [UIAAlert, UIAPopover, UIATarget]
    classes.each do |klass|
      describe "#{klass}.execute" do
        it 'should call Calabash uia method with correct parameters' do
          command = 'uia.alert() != null'
          klass.execute(command)
          @uia.command.must_equal(command)
        end
      end

      describe "#{klass}.response" do
        it "should return 'value' from response hash" do
          @uia.response =
            {
              'status' => 'success',
              'value' => true,
              'index' => 19
            }

          command = 'uia.alert() != null'
          res = klass.execute(command)
          @uia.command.must_equal(command)
          klass.response(res).must_equal(true)
        end
      end

      describe "#{klass}.response?" do
        it "should return 'value' converted to boolean from response hash" do
          @uia.response =
            {
              'status' => 'success',
              'value' => ':nil',
              'index' => 19
            }

          command = 'uia.window().popover().isVisible()'
          res = klass.execute(command)
          @uia.command.must_equal(command)
          klass.response?(res).must_equal(false)
        end
      end

      describe "#{klass}.help" do
        it 'should return public methods' do
          klass.help.must_be_kind_of(Array)
          klass.h.must_be_kind_of(Array)

          klass.help.must_include(:help)
          klass.h.must_include(:h)

          klass.help.must_equal(klass.public_methods(false))
          klass.h.must_equal(klass.public_methods(false))
        end
      end
    end
  end
end
