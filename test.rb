# class Foo
#   @a = 1
#   def self.a
#     @a
#   end
#   
#   def b
#     self.class.a
#   end
# end
# 
# p Foo.a
# p Foo.new.b


class Foo
  def initialize
    @foo = 1
  end
end

foo = Foo.new
foo.instance_variables
foo.instance_variable_get :@foo