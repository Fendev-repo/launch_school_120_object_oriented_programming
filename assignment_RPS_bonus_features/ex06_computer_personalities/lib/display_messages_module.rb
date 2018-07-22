# Provides methods to display game items
module DisplayMessages
  def display_scorecard
    puts "Remember, winner is first to #{Scorecard::WIN_SCORE} wins"
    puts 'So far, the score is...'
    puts scorecard
  end

  def display_welcome_message
    puts 'Welcome to Rock, Paper, Scissors, Lizard and Spock!'
  end

  def display_goodbye_message
    puts 'Thanks for playing Rock, Paper, Scissors, Lizard and Spock.'
    puts 'Good bye!'
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    puts 'updaing.....'
  end

  def display_round_winner
    case who_won
    when 'human'
      puts computer.vent_over_loss
      puts "#{human.name} won!"
    when 'computer'
      puts "#{computer.name} won!"
    when 'tie'
      puts "It's a tie"
    end
  end

  def print_history
    puts 'Checkout the game history'
    puts "#{human.name}'s selections => #{scorecard.move_history[:player]}"
    puts "#{computer.name}'s selections => #{scorecard.move_history[:computer]}"
  end

  def print_players_success_rates
    puts ''
    puts 'Checkout the players success for each move choice'
    puts scorecard.player_success_rates.to_s
  end

  def congratulate_winner
    puts '######### Winner!! #########'
    puts "#{who_won} was victorius: With #{Scorecard::WIN_SCORE} wins first"
    puts 'Final game score:'
    puts scorecard.to_s
    print_history
    print_players_success_rates
  end
end
