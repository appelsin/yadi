require 'yadi'

RSpec.describe "Service auto inject" do
  before do
    module Test
      class Foo
      end

      class Bar
        attr_reader :counter
        def initialize; @counter = 0 end
        def inc;        @counter+= 1 end
      end

      class Qux
        include Yadi::Inject('service.foo', bar: 'service.bar')

        attr_reader :foo, :bar

        def initialize(foo, bar:)
          @foo, @bar = foo, bar
        end
      end
    end
  end

  let(:foo) { Test::Foo.new }
  let(:bar) { Test::Bar.new }
  let(:container) do
    container = Yadi::Container.new
    container['service.foo'] = foo
    container['service.bar'] = bar
    container
  end
  let(:qux) { container.make('Test::Qux') }

  describe "make" do
    it "constructs class with injections" do
      expect(qux).to be_a(Test::Qux)
      expect(qux.foo).to eq(foo)
      expect(qux.bar).to eq(bar)
    end
  end
end