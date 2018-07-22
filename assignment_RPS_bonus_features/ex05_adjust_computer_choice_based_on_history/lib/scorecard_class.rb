# To represent the scorecard for each game played
class Scorecard
  WIN_SCORE = 4
  attr_accessor :score, :move_history, :player_success_rates

  def initialize
    @score                 = { human: 0, computer: 0, ties: 0 }
    @move_history          = { player: [], computer: [] }
    @player_success_rates  = { paper: 0, rock: 0, scissors: 0,
                               lizard: 0, spock: 0 }
  end

  def players_most_successful_move_so_far
    @player_success_rates.max_by { |_, v| v }
  end

  def update_history(winner, both_moves)
    if winner == :tie
      @move_history[:player] << "tie! players both had #{both_moves.first}"
      @move_history[:computer] << "tie! players both had #{both_moves.last}"
    else
      @move_history[:player] << both_moves.first
      @move_history[:computer] << both_moves.last
    end
  end

  def update_game_stats_when_human_wins(round_winner, both_moves)
    update_history(round_winner, both_moves)
    update_player_success_rates(both_moves.first)
  end

  def update_score_for(round_winner, both_moves)
    if round_winner == :human
      @score[:human] += 1
      update_game_stats_when_human_wins(round_winner, both_moves)
    elsif round_winner == :computer
      @score[:computer] += 1
      update_history(round_winner, both_moves)
    elsif round_winner == :tie
      @score[:ties] += 1
      update_history(round_winner, both_moves)
    end
  end

  def to_s
    h_score = score[:human]
    c_score = score[:computer]
    ties    = score[:ties]
    "Wins:  Player #{h_score}. Computer #{c_score}. Ties #{ties}"
  end

  def winning_score_reached?
    score[:human] >= WIN_SCORE || score[:computer] >= WIN_SCORE ? true : false
  end

  private

  def update_player_success_rates(successful_move)
    @player_success_rates[successful_move.to_sym] += 1
  end
end
