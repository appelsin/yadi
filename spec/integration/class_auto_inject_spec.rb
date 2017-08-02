require 'yadi'

RSpec.describe "Class auto inject" do
  before do
    module Test
      class Foo
      end

      class Bar
        attr_reader :counter
        def initialize; @counter = 0 end
        def inc;        @counter+= 1 end
      end

      class Baz
        include Yadi::Inject('Test::Foo', bar: 'Test::Bar')

        attr_reader :foo, :bar, :counter

        def initialize(foo, bar:)
          @foo, @bar, @counter = foo, bar, 0
        end

        def inc; @counter+= 1 end
      end
    end
  end

  let(:container) { Yadi::Container.new }
  let(:baz) { container.make('Test::Baz') }

  describe "make" do
    it "constructs class" do
      expect(container.make('Test::Foo')).to be_a(Test::Foo)
    end

    it "constructs class with injections" do
      expect(baz).to be_a(Test::Baz)
      expect(baz.foo).to be_a(Test::Foo)
      expect(baz.bar).to be_a(Test::Bar)
    end

    it "keeps instance" do
      expect(container.make('Test::Baz').counter).to eq(0)
      container.make('Test::Baz').inc
      expect(container.make('Test::Baz').counter).to eq(1)
    end

    it "keeps nested instance" do
      expect(container.make('Test::Baz').bar.counter).to eq(0)
      container.make('Test::Baz').bar.inc
      expect(container.make('Test::Baz').bar.counter).to eq(1)
    end
  end
end