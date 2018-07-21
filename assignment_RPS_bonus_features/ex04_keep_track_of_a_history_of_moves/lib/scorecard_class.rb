# To represent the scorecard for each game played
class Scorecard
  WIN_SCORE = 10
  attr_accessor :score, :move_history

  def initialize
    @score        = { human: 0, computer: 0, ties: 0 }
    @move_history = { player: [], computer: [] }
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

  def update_score_for(round_winner, both_moves)
    if round_winner == :human
      @score[:human] += 1
      update_history(round_winner, both_moves)
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
end
