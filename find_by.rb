module  Findable
  def method_missing(method_name)
    if variable_name = method_name.to_s.match(/find_by_(.*)/)[1]
      instance_variable_get("@#{variable_name}".to_sym)
      # or
      # send(variable_name)
    else
      raise "error"
    end
  end
end

class Foo
  include Findable
  attr_accessor :foo, :bar
  def initialize
    @foo = "FOO"
    @bar = "BAR"
  end
end  



foo = Foo.new
p foo.find_by_foo
  