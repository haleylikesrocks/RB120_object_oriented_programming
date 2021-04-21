# #### PRIVACY

# class Machine

#   def start
#     self.flip_switch(:on)
#   end

#   def stop
#     self.flip_switch(:off)
#   end

#   private

#   attr_writer :switch

#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# #### FIXED ARRAY

# class FixedArray
#   attr_accessor :array
#   attr_reader :length

#   def initialize(length)
#     @length = length
#     @array = []
#     length.times do
#       array << nil
#     end
#   end

#   def [](index)
#     raise IndexError if out_of_range(index)
#     array[index]
#   end

#   def []=(index, value)
#     raise IndexError if out_of_range(index)
#     array[index] = value
#   end

#   def to_a
#     array
#   end

#   def to_s
#     array.to_s
#   end

#   def out_of_range(index)
#     index >= length || index < length * -1
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate  < Student
#   def initialize(name, year, parking)
#     @parking = parking
#     super(name, year)
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super
#   end
# end

# class CircularQueue
#   def initialize(size)
#     @size = size
#     @queue = []
#   end

#   def enqueue(value)
#     dequeue unless has_space?
#     queue << value
#     # p queue
#   end

#   def dequeue
#     # puts queue
#     queue.shift
#   end

#   protected

#   attr_accessor :queue, :size

#   def has_space?
#     queue.size < size
#   end
# end

# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil


# class UnepectedInput < StandardError
#   def message 
#     "Invaild Opperation!"
#   end
# end

# class EmptyStack < StandardError
#   def message 
#     "The Stack is Empty!"
#   end
# end

# class Minilang
#   attr_reader :line
#   attr_accessor :stack, :commands

#   def initialize(str)
#     @register = 0
#     @stack = []
#     @commands = str.split(' ')
#   end

#   def pop(stack)
#     raise EmptyStack.new if stack.empty? 
#     stack.pop
#   end

#   def parse(command)
#     case command
#     when 'PRINT' then puts @register
#     when 'PUSH' then stack << @register
#     when 'ADD' then @register += pop(stack)
#     when 'SUB' then @register -= pop(stack)
#     when 'MULT' then @register *= pop(stack)
#     when 'DIV' then @register /= pop(stack)
#     when 'MOD' then @register = @register % pop(stack)
#     when 'POP' then @register = pop(stack)
#     else
#       raise UnepectedInput
#     end
#   end

#   def execute(command)
#     if (command.to_i.to_s == command)
#       @register = command.to_i
#     else
#       parse(command)
#     end
#   end

#   def eval
#     # parse_commands
#     commands.each do |command|
#       # puts command
#       execute(command)
#     end
#   end
# end

# Minilang.new('4 PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # # 5
# # # 3
# # # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # # 10
# # # 5

# # Minilang.new('5 PUSH POP POP PRINT').eval
# # # # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # # 12

# # Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # # # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # # 8

# Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

# class Guess
#   def initialize(low, high)
#     @low = low
#     @high = high
#   end

#   def get
#     loop do 
#       puts "Enter a number between #{low} and #{high}: "
#       @guess = gets.chomp
#       return guess.to_i if valid?
#       puts "Invalid guess."
#     end
#   end

#   protected

#   attr_accessor :guess, :low, :high

#   def valid?
#     guess.to_i.to_s == guess.to_s && guess.to_i <= high && guess.to_i >= low
#   end
# end

# class GuessingGame
#   def initialize(low, high)
#     @low = low
#     @high = high
#     @number = rand(@low..@high)
#     @attempts = Math.log2(high-low).to_i + 1
#   end

#   def play
#     loop do
#       anounce_attempts
#       @guess = new_guess
#       if guess == number
#         annnounce_win
#         break
#       end
#       announce_lower_or_higher(guess)
#       @attempts -= 1
#       if attempts == 0
#         announce_loss
#         break
#       end
#     end
#   end

#   protected

#   attr_accessor :guess, :low, :high
#   attr_reader :attempts, :number

#   def new_guess
#     loop do 
#       puts "Enter a number between #{low} and #{high}: "
#       @guess = gets.chomp
#       return guess.to_i if valid?
#       puts "Invalid guess."
#     end
#   end

#   def valid?
#     guess.to_i.to_s == guess.to_s && guess.to_i <= high && guess.to_i >= low
#   end

#   def anounce_attempts
#     puts "You have #{attempts} guesses remaining."
#   end

#   def annnounce_win
#     puts "That's the number!"
#     puts ""
#     puts "You Won!"
#   end

#   def announce_loss
#     puts "You have no ore guesses. You lost!"
#   end

#   def announce_lower_or_higher(guess)
#     puts "Your guess is too high." if guess > number
#     puts "Your guess is too low." if guess < number
#   end
# end

# game = GuessingGame.new(501, 1500)
# game.play


class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    case rank
    when 2..10 then rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    end
  end

  def <=> (other)
    value <=> other.value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

# cards = [Card.new(2, 'Hearts'),
#          Card.new(10, 'Diamonds'),
#          Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#          Card.new(4, 'Diamonds'),
#          Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#          Card.new('Jack', 'Diamonds'),
#          Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#          Card.new(8, 'Clubs'),
#          Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8


class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @deck = []
    reset
  end

  def reset 
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end

    @deck.shuffle!
  end

  def draw
    reset if @deck.size == 0
    @deck.pop
  end

end

# deck = Deck.new
# drawn = []
# p 52.times { drawn << deck.draw }
# p drawn.count { |card| card.rank == 5 } == 4
# p drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# p 52.times { drawn2 << deck.draw }
# p drawn != drawn2 # Almost always.

# Include Card and Deck classes from the last two exercises.

class PokerHand
  attr_reader :hand

  def initialize(deck)
    @hand =[]
    5.times { hand << deck.draw}
  end

  def print
    hand.each{ |card| puts card}
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    cards_needed = [10, 'Jack', 'Queen', 'King', 'Ace']
    hand.index{ |card| card.rank == 'Queen'} != nil
  end

  def straight_flush?
  end

  def four_of_a_kind?
    # hand.uniq.each do |card|
    #   return true if hand.count(card.rank) > 4
    # end
    # false
  end

  def full_house?
  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
  end
end

# hand = PokerHand.new(Deck.new)
# hand.print
# puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# # Test that we can identify each PokerHand type.
# hand = PokerHand.new([
#   Card.new(10,      'Hearts'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Queen', 'Hearts'),
#   Card.new('King',  'Hearts'),
#   Card.new('Jack',  'Hearts')
# ])
# puts hand.evaluate == 'Royal flush'

# hand = PokerHand.new([
#   Card.new(8,       'Clubs'),
#   Card.new(9,       'Clubs'),
#   Card.new('Queen', 'Clubs'),
#   Card.new(10,      'Clubs'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight flush'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Four of a kind'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Full house'

# hand = PokerHand.new([
#   Card.new(10, 'Hearts'),
#   Card.new('Ace', 'Hearts'),
#   Card.new(2, 'Hearts'),
#   Card.new('King', 'Hearts'),
#   Card.new(3, 'Hearts')
# ])
# puts hand.evaluate == 'Flush'

# hand = PokerHand.new([
#   Card.new(8,      'Clubs'),
#   Card.new(9,      'Diamonds'),
#   Card.new(10,     'Clubs'),
#   Card.new(7,      'Hearts'),
#   Card.new('Jack', 'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new('Queen', 'Clubs'),
#   Card.new('King',  'Diamonds'),
#   Card.new(10,      'Clubs'),
#   Card.new('Ace',   'Hearts'),
#   Card.new('Jack',  'Clubs')
# ])
# puts hand.evaluate == 'Straight'

# hand = PokerHand.new([
#   Card.new(3, 'Hearts'),
#   Card.new(3, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(3, 'Spades'),
#   Card.new(6, 'Diamonds')
# ])
# puts hand.evaluate == 'Three of a kind'

# hand = PokerHand.new([
#   Card.new(9, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(8, 'Spades'),
#   Card.new(5, 'Hearts')
# ])
# puts hand.evaluate == 'Two pair'

# hand = PokerHand.new([
#   Card.new(2, 'Hearts'),
#   Card.new(9, 'Clubs'),
#   Card.new(5, 'Diamonds'),
#   Card.new(9, 'Spades'),
#   Card.new(3, 'Diamonds')
# ])
# puts hand.evaluate == 'Pair'

# hand = PokerHand.new([
#   Card.new(2,      'Hearts'),
#   Card.new('King', 'Clubs'),
#   Card.new(5,      'Diamonds'),
#   Card.new(9,      'Spades'),
#   Card.new(3,      'Diamonds')
# ])
# puts hand.evaluate == 'High card'