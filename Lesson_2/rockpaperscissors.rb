# puts "hi"

class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    set_name
  end


end

class Human < Player
  def set_name
    n =  ' '
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry you have to enter a name"
    end
    self.name = n 
  end

  def choose
    chioce = nil
    loop do
      puts "Please choose rock paper or scissors"
      chioce = gets.chomp
      break if ['rock', 'paper', 'scissors'].include? chioce
      puts "Sorry invalid choice"
    end
    self.move = chioce
  end

end

class Computer < Player
  def set_name
    self.name =['R2D2', 'HAL'].sample
  end

  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors"
  end

  def display_goodbye_message
    puts "Thanks for playing #{human.name} !"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "The #{computer.name} chose #{computer.move}"
    puts "it's a tie!" if human.move == computer.move
    case human.move
    when 'rock'
      puts "#{human.name}  won!" if computer.move == 'scissors'
      puts "The #{computer.name} won" if computer.move == "paper"
      # puts "it's a tie!" if computer.move == 'rock'
    when 'paper'
      puts "#{human.name}  won!" if computer.move == 'rock'
      puts "The #{computer.name}  won" if computer.move == "scissors"
      # puts "it's a tie!" if computer.move == 'paper'
    when 'scissors'
      puts "#{human.name}  won!" if computer.move == 'paper'
      puts "The #{computer.name}  won" if computer.move === "rock"
      # puts "it's a tie!" if computer.move == 'scissors'
    end
  end

  def play_again?
    answer = nil
    loop do 
      puts "Would you like to play again?"
      answer = gets.chomp
      break if ['y', 'n']. include? answer
      puts "invalid answer please choose y or n"
    end
    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
# puts "hi"