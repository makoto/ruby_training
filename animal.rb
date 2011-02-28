class Animal
  def initialize
    @alive = true
  end
  
  def die!
    @alive = false
  end
end

class FlyingAnimal < Animal
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

class Pigeon < FlyingAnimal
  # ...
end

pigeon = Pigeon.new
puts pigeon.flying?
pigeon.take_off
puts pigeon.flying?


