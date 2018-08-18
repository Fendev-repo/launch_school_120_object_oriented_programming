# Provides score-keeping functionality
module KeepScore
  WIN_HAND_SCORE = 21

  def new_score_card
    {
      number_of_rounds_for_game: nil,
      number_of_completed_rounds: 0,
      human_wins: 0,
      dealer_wins: 0,
      human_name: nil
    }
  end

  def increment_round_completed_count
    @score_card[:number_of_completed_rounds] += 1
  end

  def reset_scorecard_for_another_game
    human_name = @score_card[:human_name]
    num_rounds = @score_card[:number_of_rounds_for_game]
    @score_card = new_score_card
    @score_card[:human_name] = human_name
    @score_card[:number_of_rounds_for_game] = num_rounds
  end

  def all_rounds_have_been_played?
    rounds_done = @score_card[:number_of_completed_rounds]
    rounds_to_play = @score_card[:number_of_rounds_for_game].to_i
    rounds_done >= rounds_to_play
  end

  def who_won_round
    human = @human.best_hand_option
    dealer = @dealer.best_hand_option

    return :dealer if hand_is_busted? :human
    return :human if hand_is_busted? :dealer

    return :draw if human == WIN_HAND_SCORE && dealer == WIN_HAND_SCORE
    human > dealer ? :human : :dealer
  end

  def update_score_card
    winner = who_won_round
    return if winner == :draw
    @score_card["#{winner}_wins".to_sym] += 1
    @score_card[:number_of_completed_rounds] += 1
  end

  def present_round_result
    clear_cli
    present_table :open_hand
    winner = who_won_round
    print_to_cli ''
    if winner == :human
      print_to_cli 'You won the round!'
      print_to_cli "#{Game::CUDOS} #{@score_card[:human_name]}"
    else
      print_to_cli 'Dealer won!'
    end
  end
end
