# Provides CLI interactive functionality
module CliDisplay
  private

  def clear_cli
    system('clear') || system('cls')
  end

  def show_game_score_board
    print_to_cli 'Scoreboard:'
    print_to_cli "Best of #{@score_card[:number_of_rounds_for_game]} rounds"
    if @score_card[:number_of_completed_rounds].zero?
      print_to_cli 'This is the first round'
    else
      print_to_cli "This is round #{@score_card[:number_of_completed_rounds]}"
    end
    print_to_cli "#{@score_card[:human_name]}: #{@score_card[:human_wins]} wins"
    print_to_cli "Dealer: #{@score_card[:dealer_wins]} wins"
    print_to_cli ''
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable MethodLength
  def present_table(dealer_hand = :obscure_dealer_hand)
    if dealer_hand == :open_hand
      hand = @dealer.show_hand.to_s
      hand_total = @dealer.show_hand_total.to_s
    else
      hand = "#{@dealer.show_hand.first} [?]"
      hand_total = '???'
    end

    show_game_score_board
    print_to_cli "Dealers hand: #{hand}"
    print_to_cli "Hand total: #{hand_total}"
    print_to_cli 'BUSTED!!!' if hand_is_busted? :dealer

    print_to_cli '++++++++++++++++'
    print_to_cli '++++++++++++++++'
    print_to_cli '++++++++++++++++'
    print_to_cli '++++++++++++++++'
    print_to_cli "Your hand #{@human.show_hand}"
    print_to_cli "Hand total: #{@human.show_hand_total}"
    print_to_cli 'BUSTED!!!' if hand_is_busted? :human
  end
  # rubocop:enable MethodLength
  # rubocop:enable Metrics/AbcSize

  def print_to_cli(msg)
    puts msg
  end

  def collect_input(request_msg, desired_input_pattern, save_data_to = nil)
    reply = nil
    loop do
      reply = gets.chomp.downcase
      break if reply.match? desired_input_pattern
      print_to_cli "Wrong input: #{request_msg}"
    end
    # If no 'save_data_to' argument passed - then return the 'reply'
    # else - update the score_card
    save_data_to.nil? ? reply : @score_card[save_data_to] = reply
  end

  def welcome_to_new_game
    print_to_cli 'Welcome to 21!'
  end

  def joiner(ary, seperator = 'or')
    new_ary = ary.dup
    last_item = new_ary.pop
    "#{new_ary.join(', ')} #{seperator} #{last_item}?"
  end

  def new_round_starting
    print_to_cli 'Starting new round!'
  end

  def collect_human_players_name
    print_to_cli 'What is your name?'
    collect_input 'I need your name', '\S[a-z]+\S', :human_name
  end

  def confirm_number_of_rounds_for_game
    msg = 'I need number of rounds'
    print_to_cli 'How many rounds do you want to play?'
    print_to_cli "Best of #{joiner(Game::NUM_ROUND_OPTIONS)}"
    collect_input msg, '[369]{1}', :number_of_rounds_for_game
  end

  def thank_players_for_game
    print_to_cli 'Thank you for playing 21!'
  end

  def human_wants_to_a_play_another_game?
    show_game_score_board
    print_to_cli 'Would you like another game?'
    reply = collect_input 'I need a yes or no', '^[yn]'
    reset_scorecard_for_another_game
    reply == 'y'
  end

  def welcome_players_to_next_round
    print_to_cli 'Get ready for the next round!'
    print_to_cli 'Dealing! => [][]'
    print_to_cli ''
    print_to_cli '=> here are your next cards!'
    sleep 2.5
  end

  def welcome_players
    game_has_not_started? ? welcome_to_new_game : new_round_starting
  end
end
