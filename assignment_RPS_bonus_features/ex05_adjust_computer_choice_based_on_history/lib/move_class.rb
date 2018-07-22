require_relative 'move_value_classes/lizard_class'
require_relative 'move_value_classes/paper_class'
require_relative 'move_value_classes/rock_class'
require_relative 'move_value_classes/scissors_class'
require_relative 'move_value_classes/spock_class'

# To represent a 'move' which a player of the game can take.
class Move
  VALUES = %w(rock paper scissors lizard spock).freeze

  attr_reader :value

  def initialize(value)
    value = choose_correct_class_as_value(value)
    @value = value
  end

  def scissors?
    @value.name == 'scissors'
  end

  def rock?
    @value.name == 'rock'
  end

  def paper?
    @value.name == 'paper'
  end

  def lizard?
    @value.name == 'lizard'
  end

  def spock?
    @value.name == 'spock'
  end

  def to_s
    @value.name
  end

  private

  def choose_correct_class_as_value(value)
    case value
    when 'paper'    then Paper.new
    when 'rock'     then Rock.new
    when 'scissors' then Scissors.new
    when 'lizard'   then Lizard.new
    when 'spock'    then Spock.new
    end
  end
end
