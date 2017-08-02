require 'yadi/injector'

module Yadi
  class ModuleBuilder < ::Module
    def initialize(*args)
      @args = args
    end

    def included(klass)
      klass.const_set('INITIALIZE_INJECT', Injector.new(@args))
    end
  end
end