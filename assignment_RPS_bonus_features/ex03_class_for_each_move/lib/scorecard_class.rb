# To represent the scorecard for each game played
class Scorecard
  WIN_SCORE = 5
  attr_accessor :score

  def initialize
    @score = { human: 0, computer: 0 }
  end

  def to_s
    "Player has won #{score[:human]}, while Computer is on #{score[:computer]}"
  end

  def winning_score_reached?
    score[:human] >= WIN_SCORE || score[:computer] >= WIN_SCORE ? true : false
  end
end
