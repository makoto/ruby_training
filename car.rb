class Car
  attr_accessor :top_speed
  def initialize(top_speed = 100)
    @top_speed = top_speed
  end
end


car = Car.new(150)
puts car.top_speed
car.top_speed = 250
puts car.top_speed
