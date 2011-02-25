module ValidatableModule
  module ClassMethods
    def validate_blank(*method)
      @methods ||= []
      @methods = @methods + method
    end
    
    def methods_array
      @methods
    end
  end
  
  module InstanceMethods
    def valid?
      self.class.methods_array.each do |method|
        errors[method] = 'is blank' unless send(method) # message passing
      end
      errors == {}
    end
    
    def errors
      @errors ||={}
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end

class Foo
  include ValidatableModule
  validate_blank :foo, :bar
  validate_blank :baz

  #accessor
  attr_accessor :foo, :bar, :baz
end


foo = Foo.new
foo.bar = 1
foo.foo = 2
# foo.baz = 3
p foo.valid?
p foo.errors[:baz]