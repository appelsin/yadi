require 'yadi/maker'
require 'yadi/box'
require 'yadi/klass_box'
require 'yadi/factory_box'

module Yadi
  class Container
    def initialize
      @repo = {}
    end

    def register!(*args)
      args_count = args.count
      if 1 == args_count
        register_klass(*args)
      elsif args_count > 1
        register_value(*args)
      else
        raise 'Unknown register call pattern'
      end
    end

    def has?(name)
      @repo.has_key?(name)
    end

    def register(*args)
      name = args[0]
      if has?(name)
        raise "'#{name}' already registered. Use register! if you whant to force rewrite value."
      else
        register!(*args)
      end
    end

    def register_value(name, value, wrap: Box)
      @repo[name] = wrap.new(value)
    end
    alias_method :[]=, :register_value

    def register_klass(name)
      @repo[name] = KlassBox.new(name)
    end
    alias_method :<<, :register_klass

    def make(name)
      box = has?(name) ? @repo[name] : register_klass(name)
      box.(self)
    end
    alias_method :[], :make

    def resolve(name)
      if has?(name)
        box = @repo[name]
        box.(self)
      else
        raise "Can't resolve #{name}"
      end
    end
  end
end