# To represent the rules of the game
class RuleBook
  WIN_MOVES = { scissors: %w(paper lizard),
                paper:    %w(rock spock),
                rock:     %w(lizard scissors),
                lizard:   %w(spock paper),
                spock:    %w(scissors rock) }.freeze

  def moves
    WIN_MOVES
  end

  def who_has_best_move(human, computer)
    human_mv          = human.move.value.to_sym
    computer_mv       = computer.move.value.to_sym
    human_win_options = WIN_MOVES[human_mv]

    human_win_options.include?(computer_mv.to_s) ? 'human' : 'computer'
  end
end
