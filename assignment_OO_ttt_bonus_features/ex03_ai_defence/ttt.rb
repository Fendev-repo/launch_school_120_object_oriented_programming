require_relative 'board_class'
require_relative 'player_class'
require_relative 'square_class'
require 'pry-byebug'

# Object which orchestrates game
class TTTGame
  HUMAN_MARKER = 'X'.freeze
  COMPUTER_MARKER = 'O'.freeze
  FIRST_TO_MOVE = HUMAN_MARKER
  WIN_SCORE = 3

  attr_reader :board, :human, :computer, :score

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
    @score = { human: 0, computer: 0 }
  end

  def play
    clear
    display_welcome_message

    # Play loop - break when player is finished playing program.
    loop do

      # Game loop - break when the winning score is reached
      loop do
        display_board

        # Round loop - break when round is won or tied
        loop do
          current_player_moves
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
        end
      
        update_score
        display_result
        break if winning_score_reached?
        reset
        display_play_again_message
      end
        
      break unless play_again?
      reset_board_and_score
    end

    display_goodbye_message
  end

  private

  def reset_board_and_score
    reset
    @score = { human: 0, computer: 0 }
  end

  def winning_score_reached?
    score.values.any? { |v| v >= WIN_SCORE }
  end

  def present_score_board
    puts "Current score:"
    puts "Human: #{score[:human]} wins"
    puts "Computer: #{score[:computer]} wins"
  end

  def update_score
    case board.winning_marker
    when HUMAN_MARKER then @score[:human] += 1
    when COMPUTER_MARKER then @score[:computer] += 1  
    end
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ''
    present_score_board
    puts ''
    board.draw
    puts ''
  end

  def joiner(unmarked_keys, delimiter = ', ', last_num_seperator = ' or ')
    copy_of_keys = unmarked_keys.dup
    return unmarked_keys.first if unmarked_keys.length < 2
    last_num = copy_of_keys.pop
    "#{copy_of_keys.join(delimiter)} #{last_num_seperator} #{last_num}"
  end

  def human_moves
    puts "Choose a square #{joiner(board.unmarked_keys)}:"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    if board.square_under_threat
      board[board.square_under_threat] = computer.marker
    else
      board[board.unmarked_keys.sample] = computer.marker
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts 'Sorry, must be y or n'
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end
end

game = TTTGame.new
game.play
