module Yadi
  class KlassBox
    def initialize(klass_name)
      @klass_name = klass_name
    end

    def call(container)
      @contents||= Maker.call(container, @klass_name)
    end
  end
end
