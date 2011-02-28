class Animal
  def initialize
    @alive = true
  end
  
  def die!
    @alive = false
  end
end

module FlyingAnimal
  attr_accessor :flying

  def initialize
    self.flying = false
    super
  end
  
  def take_off
    self.flying = true
  end
  
  def land
    self.flying = false
  end
  
  def flying?
    flying
  end
end

module SwimmingAnimal
  #...
end

class Pigeon < Animal
  include FlyingAnimal
  # ...
end

class Tuna < Animal
  include SwimmingAnimal
  # ....
end


class Duck < Animal
  include FlyingAnimal
  include SwimmingAnimal
end

pigeon = Pigeon.new
puts pigeon.flying?
pigeon.take_off
puts pigeon.flying?


