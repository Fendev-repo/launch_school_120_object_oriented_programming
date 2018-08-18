# Provides round status functionality
module GameStatus
  def game_status
    return :new_game if @score_card[:human_name].nil?

    if @score_card[:human_wins].zero? && @score_card[:dealer_wins].zero?
      :play_again
    elsif @score_card[:number_of_completed_rounds] <= 1
      :next_round
    end
  end

  def hand_is_busted?(competitor)
    competitor == :human ? @human.hand_busted? : @dealer.hand_busted?
  end

  def game_has_not_started?
    @score_card[:number_of_rounds_for_game].nil?
  end
end
