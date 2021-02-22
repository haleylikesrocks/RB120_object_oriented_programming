#### Reading and writing

class Person
  attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

#### Choose the right method

class Person
  attr_accessor :name
  attr_writer :phone_number
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name

#### Access Denined 

class Person
  attr_reader :phone_number

  def initialize(number)
    @phone_number = number
  end
end

person1 = Person.new(1234567899)
puts person1.phone_number

person1.phone_number = 9987654321
puts person1.phone_number

#### Comparing Names

class Person
  attr_accessor :first_name
  attr_writer :last_name


  def first_equals_last?
    first_name == last_name
  end

  protected

  attr_reader :last_name

end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

#### Who is Older

class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected
  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)

#### Guaranteed Formatting

class Person
  attr_reader :name

  def name=(name)
    @name = name.capitalize
  end
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

#### Prefix the Name

class Person
  attr_writer :name

  def name
    'Mr. ' + @name
  end
end

person1 = Person.new
person1.name = 'James'
puts person1.name

#### Avoid Mutation

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name.clone
  end
end

person1 = Person.new('James')
person1.name.reverse!
puts person1.name

#### Calculated Age

class Person
  def age=(age)
    @age = age * 2
  end

  def age
    @age * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age

#### Unexpected Change

class Person
  def name=(name)
    @first = name.split[0]
    @last = name.split[1]
  end

  def name
    "#{@first} #{@last}"
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name