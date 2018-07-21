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
    human_mv          = human.move.value.name
    computer_mv       = computer.move.value.name
    human_win_options = WIN_MOVES[human_mv.to_sym]

    human_win_options.include?(computer_mv) ? 'human' : 'computer'
  end
end
