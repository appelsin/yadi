module Yadi
  class Injector
    attr_reader :args
    attr_reader :options

    def initialize(args)
      options = args.last.is_a?(::Hash) ? args.pop : {}
      @args = args.freeze
      @options = options.freeze
    end
  end
end