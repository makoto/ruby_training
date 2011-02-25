
module Validatable
  # class 
  class Base
    # class varialbes
    @@methods = []
    
    # class methods
    def self.validate_blank(*method)
      @@methods = @@methods + method
    end
    
    # instance methods
    def valid?
      @@methods.each do |method|
        errors[method] = 'is blank' unless send(method) # message passing
      end
      errors == {}
    end
    
    def errors
      @errors ||= {}
    end
  end
end

class Foo < Validatable::Base
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