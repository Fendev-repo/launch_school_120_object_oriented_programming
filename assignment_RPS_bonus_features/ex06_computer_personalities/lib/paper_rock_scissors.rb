require_relative 'computer_class'
require_relative 'human_class'
require_relative 'player_class'
require_relative 'scorecard_class'
require_relative 'rule_book_class'
require_relative 'display_messages_module'

# To orchestrate the program classes to enable game play.
class RPSGame
  attr_accessor :human, :computer, :scorecard, :rulebook

  include DisplayMessages

  def initialize
    @human      = Human.new
    @computer   = Computer.new
    @scorecard  = Scorecard.new
    @rulebook   = RuleBook.new
  end

  def both_moves
    [human.move.value.name, computer.move.value.name]
  end

  def update_scorecard
    winner = who_won

    case winner
    when 'human'
      then scorecard.update_score_for(:human, both_moves)
    when 'computer'
      then scorecard.update_score_for(:computer, both_moves)
    when 'tie'
      then scorecard.update_score_for(:tie, both_moves)
    end
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

  def clear_terminal
    sleep 4
    puts ' => and now clearing the terminal for the next round!'
    sleep 5
    system 'clear'
  end

  def play_round
    display_scorecard
    human.choose
    computer.choose(scorecard)
    display_moves
    update_scorecard
    display_round_winner
  end

  def play
    display_welcome_message
    loop do
      play_round
      clear_terminal
      next unless scorecard.winning_score_reached?
      congratulate_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

game = RPSGame.new
game.play
