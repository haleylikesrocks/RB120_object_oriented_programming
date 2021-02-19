# # 1 Find the Class

# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# 2 Create the Class # 4 What Are You?

module Walkable
  def walk 
    puts "Let's got for a walk!"
  end
end

class Cat
  include Walkable
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{self.name}!"
  end
end

# 3 Create the Class

kitty = Cat.new('Sophie')
kitty.greet

kitty.name = 'Luna'

kitty.greet

kitty.walk
