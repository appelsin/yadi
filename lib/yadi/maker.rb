require 'yadi/constantize'

module Yadi
  class Maker
    def self.call(container, klass_name)
      klass = Constantize.(klass_name)

      if klass.const_defined?(:INITIALIZE_INJECT)
        args = klass::INITIALIZE_INJECT.args.map do |inj|
          container.make(inj)
        end

        options = ::Hash[
          klass::INITIALIZE_INJECT.options.map do |key, inj|
            [key, container.make(inj)]
          end
        ]

        args << options unless options.empty?

        klass.new *args
      else
        klass.new
      end
    end
  end
end