module Yadi
  class Box
    def initialize(contents)
      @contents = contents
    end

    def call(container)
      @contents
    end
  end
end
