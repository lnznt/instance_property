require "instance_property/version"

module InstanceProperty
  def property(sym, default = nil, &initializer)
      initializer ||= -> * { default }

      define_method(sym) do |*args|
        name = "@#{sym}".to_sym

        if !args.empty?
          instance_variable_set name, args.first
        elsif !instance_variable_defined? name
          instance_variable_set name, instance_eval(&initializer)
        end

        instance_variable_get name
      end
  end

  def properties(sym0, *syms, &initializer)
    ([sym0] + syms).each {|sym| property sym, &initializer }
  end
end
