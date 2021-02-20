# Classes and Objects  - Vehicle Example

module Towable
  def towing?
    true
  end
end

class Vehicle
  @@num_object = 0

  def initialize(year, color, model)
    @speed = 0
    @year = year
    @color = color
    @model = model
    @@num_object += 1
  end

  def shut_off
    @speed = 0
  end

  def speed_up(new_speed)
    @speed += new_speed
  end

  def break(new_speed)
    @speed -= new_speed
  end

  def calc_milage(gas, miles)
    miles / gas
  end

  def self.how_many_vehicles
    "#{@@num_object} vehicles"
  end

  def spray_paint(color)
    self.color = color
    puts "Your new #{color} paint job looks great!"
  end

  def to_s
    "This is a #{self.color} #{self.year} #{self.model}. That is currently going #{@speed} mph."
  end

  def age(current_year)
    current_year - self.year
  end

end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2

  include Towable
end

class NewCar < Vehicle
  NUMBER_OF_DOORS = 4

  attr_accessor :color
  attr_reader :year, :model 

  def initialize(year, color, model)
    super(year, color, model)
  end

end

corrolla = NewCar.new(2007, "blue", "corolla")
puts corrolla
puts corrolla.calc_milage(10, 300)

tuck = MyTruck.new(2008, "black", "f150")
p tuck.towing?

puts Vehicle.how_many_vehicles

puts "------Vehicle lookup ------"
puts Vehicle.ancestors
puts "-----Car lookup-----"
puts NewCar.ancestors
puts "-----Truck lookup-----"
puts MyTruck.ancestors


##### Person Example

class Person
  attr_accessor :name
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(human)
    self.grade < human.grade
  end

  protected
  attr_reader :grade
end

bob = Person.new("Steve", "B")
bob.name = "Bob"

joe = Person.new("Joe", "A")

puts "Well done!" if joe.better_grade_than?(bob)