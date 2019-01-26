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

  def initialize(move)
    @move = move
  end

  def self.create(move)
    @game = Game.new(move)
  end

  def self.instance
    @game
  end

end
