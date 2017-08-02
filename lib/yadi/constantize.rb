module Yadi
  class Constantize
    def self.call(klass_name)
      klass_name.to_s
                .split('::')
                .reduce(Object) do |m, v|
                  m.const_get(v)
                end
    end
  end
end