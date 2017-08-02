require 'yadi/constantize'

RSpec.describe Yadi::Constantize do
  before do
    module Test
      module Bar
        class Baz
        end
      end
    end
  end

  it "returns constant by string name" do
    expect(described_class.('Test')).to eq(Test)
  end

  it "returns constant by symbol name" do
    expect(described_class.(:Test)).to eq(Test)
  end

  it "returns constant by namespaced string name" do
    expect(described_class.('Test::Bar::Baz')).to eq(Test::Bar::Baz)
  end

  it "returns constant by namespaced symbol name" do
    expect(described_class.(:'Test::Bar::Baz')).to eq(Test::Bar::Baz)
  end

  it "raises NameError for unknown constant" do
    expect{ described_class.(:'Test::Foo') }.to raise_error(NameError)
  end
end