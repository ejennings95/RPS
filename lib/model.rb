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

  attr_reader :counter

  def initialize(counter = Counter.new)
    @counter = counter
  end

  def self.create
    @rps = RockPaperScissors.new if @rps.nil?
  end

  def self.instance
    @rps
  end

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
    if player1 == computer
      @counter.draw_counter
      return 'Draw!'
    end
    if decider[player1.to_sym] == computer.to_sym
      @counter.win_counter
      return true
    end
    if decider[player1.to_sym] != computer.to_sym
      @counter.lose_counter
      return false
  end
end

end

class Counter

  attr_reader :game_count, :win_count, :lose_count, :draw_count

  def initialize
    @game_count = 0
    @win_count = 0
    @lose_count = 0
    @draw_count = 0
  end

  def draw_counter
    @draw_count += 1
    @game_count += 1
  end

  def win_counter
    @win_count += 1
    @game_count += 1
  end

  def lose_counter
    @lose_count += 1
    @game_count += 1
  end
end
