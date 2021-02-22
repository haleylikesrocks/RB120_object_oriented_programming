#### 1. Given the below usage of the Person class, code the class definition.

class Person
  attr_accessor :last_name, :first_name

  def initialize(n)
    split_name(n)
  end

  def name
    "#{@first_name} #{@last_name}".strip
  end

  def name=(new_name)
    split_name(new_name)
  end

  def split_name(full_name)
    @name = full_name
    @first_name = full_name.split(" ")[0]
    @last_name = full_name.split(" ").size > 1? full_name.split(" ")[1] : ''
  end

  def same_name?(human)
    @name == human.name
  end

  def to_s
    name
  end

end

#### Modify the class definition from above to facilitate the following methods

bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p rob.same_name?(bob)

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"