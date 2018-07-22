require_relative 'human_class'
require_relative 'scorecard_class'

# To represent the computer 'AI oposition' object in our game.
class Computer < Player
  COUNTER_STRATEGY = {  paper:    %w(scissors lizard),
                        rock:     %w(paper spock),
                        scissors: %w(rock spock),
                        lizard:   %w(scissors rock),
                        spock:    %w(lizard paper) }.freeze

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose(scorecard)
    counter_attack(scorecard)
  end

  def counter_attack(scorecard)
    target = scorecard.players_most_successful_move_so_far
    attacking_move = COUNTER_STRATEGY[target[0]].sample
    self.move = Move.new(attacking_move)
  end
end
