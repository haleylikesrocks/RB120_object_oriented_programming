module UsesArmor
  def attach_armor
  end

  def remove_armor
  end
end

module CastsSpells
  def cast_spell(spell)
  end
end

class Player
  def initialize(name)
    @name = name
    @health = 100
    @strength = roll_dice
    @intelligence = roll_dice
  end

  def heal(value)
    self.health += value
  end

  def hurt(value)
    self.health -=value
  end

  def to_s
    puts "Name: #{@name}"
    puts "Class: #{self.class}"
    puts "Health: #{@health}"
    puts "Strength: #{@strength}"
    puts "Inteligence: #{@intelligence}"
  end

  private

  attr_accessor :health

  def roll_dice
    rand(1..12)
  end 
end

class Warrior < Player
  include UsesArmor

  def initialize(name)
    super(name)
    @strength += 2
  end
end

class Paladin < Player
  include CastsSpells
  include UsesArmor
end

class Magician < Player
  include CastsSpells
  def initialize(name)
    super(name)
    @intelligence += 2
  end
end

class Bard < Magician
  def create_potion
  end
end

# Magician.new()
# ArgumentError: wrong number of arguments (given 0, expected 1)

the_real_g = Magician.new("Gandalf")
puts the_real_g