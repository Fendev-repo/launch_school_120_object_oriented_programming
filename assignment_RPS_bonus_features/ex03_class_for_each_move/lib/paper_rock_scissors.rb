require_relative 'computer_class'
require_relative 'human_class'
require_relative 'player_class'
require_relative 'scorecard_class'
require_relative 'rule_book_class'

# To orchestrate the program classes to enable game play.
class RPSGame
  attr_accessor :human, :computer, :scorecard, :rulebook

  def initialize
    @human      = Human.new
    @computer   = Computer.new
    @scorecard  = Scorecard.new
    @rulebook   = RuleBook.new
  end

  def display_scorecard
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
  end

  def update_scorecard
    winner = who_won
    score  = scorecard.score

    return if winner == 'tie'
    winner == 'human' ? score[:human] += 1 : score[:computer] += 1
  end

  def display_round_winner
    case who_won
    when 'human'
      puts "#{human.name} won!"
    when 'computer'
      puts "#{computer.name} won!"
    when 'tie'
      puts "It's a tie"
    end
  end

  def congratulate_winner
    puts "#{who_won} was victorius: With #{Scorecard::WIN_SCORE} wins first"
  end

  def who_won
    return 'tie' if human.move.value.name == computer.move.value.name
    rulebook.who_has_best_move(human, computer)
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts 'Sorry, must be y or n.'
    end

    return false if answer == 'n'
    return true if answer == 'y'
  end

  def play_round
    display_scorecard
    human.choose
    computer.choose
    display_moves
    update_scorecard
    display_round_winner
  end

  def play
    display_welcome_message
    loop do
      play_round
      next unless scorecard.winning_score_reached?
      congratulate_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
