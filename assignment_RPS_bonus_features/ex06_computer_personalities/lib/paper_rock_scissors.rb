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

  def valid_answer?(user_reply)
    u_reply = user_reply.downcase
    u_reply == 'y' || u_reply == 'n'
  end

  def player_wants_another_round?
    answer = nil
    puts 'Would you like to play again? (y/n)'
    loop do
      answer = gets.chomp.downcase
      break if valid_answer?(answer)
      puts 'Sorry, must be y or n.'
    end
    answer == 'y'
  end

  def clear_cli
    system 'clear'
  end

  def prep_next_round
    sleep 4
    puts ' => and now clearing the terminal for the next round!'
    sleep 2
    clear_cli
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
      prep_next_round
      next unless scorecard.winning_score_reached?
      congratulate_winner
      scorecard.reset_to_zero
      break unless player_wants_another_round?
    end
    display_goodbye_message
  end
end

def play_new_game
  game = RPSGame.new
  game.play
end

play_new_game
