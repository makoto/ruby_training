class Car
  def initialize(top_speed = 100)
    @top_speed = top_speed
  end
  
  def get_topspeed
    return @top_speed
  end
  
  def set_topspeed(speed)
    @top_speed = speed
    return @top_speed
  end
end


car = Car.new(150)
puts car.get_topspeed
car.set_topspeed(250)
puts car.get_topspeed
