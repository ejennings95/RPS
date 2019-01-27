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

  attr_reader :move
  attr_accessor :computer_move

  def initialize(move, computer_move = RockPaperScissors.new.move_generator)
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

  def winner(player1, computer)
    return draw if player1 == computer
    return player1_win if decider[player1.to_sym] == computer.to_sym
    return player2_win if decider[player1.to_sym] != computer.to_sym
  end

  private

  def decider
    {
   :Rock => :Scissors,
   :Scissors => :Paper,
   :Paper => :Rock
    }
  end

  def player1_win
    @counter.win_counter
    return true
  end

  def player2_win
    @counter.lose_counter
    return false
  end

  def draw
    @counter.draw_counter
    return 'Draw!'
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

  def reset_counter
    @game_count = 0
    @win_count = 0
    @lose_count = 0
    @draw_count = 0
  end
end

class Switch
  attr_reader :current_turn, :opponent, :players

  def initialize(player1, player2)
    @players = [player1, player2]
    @current_turn = player1
    @opponent = player2
  end

  def self.create(player1, player2)
    @switch = Switch.new(player1, player2) if @rps.nil?
  end

  def self.instance
    @switch
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switching_turns
    @opponent = @current_turn
    @current_turn = opponent_of(@current_turn)
  end

  private

  def opponent_of(current_player)
    @players.select { |player| player != current_player }.first
  end
end
