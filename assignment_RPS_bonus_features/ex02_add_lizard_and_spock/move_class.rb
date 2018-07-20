# To represent a 'move' which a player of the game can take.
class Move
  VALUES = %w(rock paper scissors lizard spock).freeze

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def to_s
    @value
  end
end
