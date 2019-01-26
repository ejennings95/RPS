class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.create(name)
    @player = Player.new(name)
  end

  def self.instance
    @player
  end
end

class Game

  attr_reader :move, :computer_move

  def initialize(move, computer_move)
    @move = move
    @computer_move = computer_move
  end

  def self.create(move, computer_move)
    @game = Game.new(move, computer_move)
  end

  def self.instance
    @game
  end
end

class RockPaperScissors

  def move_generator
    ["Rock", "Paper", "Scissors"].sample
  end

  def decider
    {
   :Rock => :Scissors,
   :Scissors => :Paper,
   :Paper => :Rock
    }
  end

  def winner(player1, computer)
    return 'Draw!' if player1 == computer
    decider[player1.to_sym] == computer.to_sym ? true : false
  end
end
