class FurryPet
  def speak(sound)
    "#{sound}"
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < FurryPet
  def speak
    super('bark')
  end

  def fetch
    'fetching!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < FurryPet
  def speak
    super('Meow')
  end
end

teddy = Bulldog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

franklin = Cat.new
p franklin.speak