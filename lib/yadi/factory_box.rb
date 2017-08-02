module Yadi
  class FactoryBox
    attr_reader :contents

    def initialize(klass_name)
      @klass_name = klass_name
    end

    def call(container)
      Maker.call(container, @klass_name)
    end
  end
end