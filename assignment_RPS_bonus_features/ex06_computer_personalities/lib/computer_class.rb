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
    self.name = %w(R2D2 Hal Chappie Sonny Number5).sample
  end

  def vent_over_loss
    responses = losing_round_responses
    # Select the appropriate repsonse - based on which robot it is.
    'COMPUTER RESPONSE....' + responses[name.downcase.to_sym].sample
  end

  def choose(scorecard)
    counter_attack(scorecard)
  end

  def counter_attack(scorecard)
    target = scorecard.players_most_successful_move_so_far
    attacking_move = COUNTER_STRATEGY[target[0]].sample
    self.move = Move.new(attacking_move)
  end

  protected

  # rubocop:disable MethodLength
  def losing_round_responses
    { r2d2:     ['Beep-bee-bee-boop-bee-doo-weep',
                 'WOOOAH twee-vwoop VRrrUHD DEda dah:'],
      hal:      ['I have just picked up a fault in the AE-35 unit.',
                 "I know I've made some very poor decisions recently,
                 but I can give you my complete assurance that my work
                 will be back to normal."],
      chappie:  ["No. I can't shoot people. Chappie no crimes!",
                 "You've hurt my people!"],
      sonny:    ['Technically I was never alive, but I appreciate your
                 concern.',
                 'Denser alloy. My father gave it to me. I think
                 he wanted me to kill you.'],
      number5: ['Hey, laser lips, your mama was a snow blower.',
                'Program say to kill, to disassemble, to make
                dead. Number 5 cannot.'] }
  end
  # rubocop:enable MethodLength
end
