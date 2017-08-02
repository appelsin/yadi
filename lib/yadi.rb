require 'yadi/module_builder'
require 'yadi/container'

module Yadi
  def self.Inject(*args)
    ModuleBuilder.new(*args)
  end
end